

WITH
-- Reference dates
ref AS (
    SELECT
        MIN(InvoiceDate) AS MinInvoiceDate,
        MAX(InvoiceDate) AS MaxInvoiceDate
    FROM Invoice
),

-- Recursive CTE: calendar month series from min to max invoice date
calendar_months AS (
    SELECT
        DATEFROMPARTS(YEAR(r.MinInvoiceDate), MONTH(r.MinInvoiceDate), 1) AS MonthStart,
        DATEFROMPARTS(YEAR(r.MaxInvoiceDate), MONTH(r.MaxInvoiceDate), 1) AS MaxMonthStart
    FROM ref r

    UNION ALL

    SELECT
        DATEADD(MONTH, 1, cm.MonthStart),
        cm.MaxMonthStart
    FROM calendar_months cm
    WHERE cm.MonthStart < cm.MaxMonthStart
),

-- Monthly revenue aligned to calendar (fills missing months with 0)
monthly_revenue AS (
    SELECT
        cm.MonthStart,
        COALESCE(SUM(i.Total), 0) AS MonthlyRevenue
    FROM calendar_months cm
    LEFT JOIN Invoice i
        ON i.InvoiceDate >= cm.MonthStart
       AND i.InvoiceDate <  DATEADD(MONTH, 1, cm.MonthStart)
    GROUP BY cm.MonthStart
),

-- Trend metrics using window functions
revenue_trends AS (
    SELECT
        MonthStart,
        MonthlyRevenue,
        LAG(MonthlyRevenue) OVER (ORDER BY MonthStart) AS PrevMonthRevenue,
        SUM(MonthlyRevenue) OVER (ORDER BY MonthStart ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotalRevenue
    FROM monthly_revenue
),

-- Customer-level invoice metrics
customer_invoice_metrics AS (
    SELECT
        c.CustomerId,
        c.FirstName,
        c.LastName,
        c.Country,
        COUNT(i.InvoiceId) AS InvoiceCount,
        SUM(CAST(i.Total AS DECIMAL(18,2))) AS LifetimeValue,
        AVG(CAST(i.Total AS DECIMAL(18,2))) AS AvgInvoiceValue,
        MIN(i.InvoiceDate) AS FirstPurchaseDate,
        MAX(i.InvoiceDate) AS LastPurchaseDate
    FROM Customer c
    LEFT JOIN Invoice i
        ON i.CustomerId = c.CustomerId
    GROUP BY
        c.CustomerId, c.FirstName, c.LastName, c.Country
),

-- Retention stages (relative to dataset max date)
customer_retention AS (
    SELECT
        cim.*,
        CASE
            WHEN cim.InvoiceCount IS NULL OR cim.InvoiceCount = 0 THEN 'No purchases'
            WHEN cim.LastPurchaseDate < DATEADD(MONTH, -12, r.MaxInvoiceDate) THEN 'Churned (inactive 12m)'
            WHEN cim.InvoiceCount = 1 THEN 'New (1 purchase)'
            WHEN cim.InvoiceCount BETWEEN 2 AND 3 THEN 'Repeat (2-3)'
            ELSE 'Loyal (4+)'
        END AS RetentionStage,
        DATEDIFF(DAY, cim.LastPurchaseDate, r.MaxInvoiceDate) AS DaysSinceLastPurchase
    FROM customer_invoice_metrics cim
    CROSS JOIN ref r
),

-- Genre revenue (multi-table joins)
genre_perf AS (
    SELECT
        g.GenreId,
        g.Name AS GenreName,
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS GenreRevenue,
        SUM(CAST(il.Quantity AS INT)) AS UnitsSold
    FROM InvoiceLine il
    JOIN Track t  ON t.TrackId  = il.TrackId
    JOIN Genre g  ON g.GenreId  = t.GenreId
    GROUP BY g.GenreId, g.Name
),

ranked_genres AS (
    SELECT
        GenreId,
        GenreName,
        GenreRevenue,
        UnitsSold,
        RANK() OVER (ORDER BY GenreRevenue DESC) AS GenreRevenueRank
    FROM genre_perf
),

-- Artist revenue (multi-table joins)
artist_perf AS (
    SELECT
        ar.ArtistId,
        ar.Name AS ArtistName,
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS ArtistRevenue,
        SUM(CAST(il.Quantity AS INT)) AS UnitsSold
    FROM InvoiceLine il
    JOIN Track t   ON t.TrackId  = il.TrackId
    JOIN Album al  ON al.AlbumId = t.AlbumId
    JOIN Artist ar ON ar.ArtistId = al.ArtistId
    GROUP BY ar.ArtistId, ar.Name
),

ranked_artists AS (
    SELECT
        ArtistId,
        ArtistName,
        ArtistRevenue,
        UnitsSold,
        RANK() OVER (ORDER BY ArtistRevenue DESC) AS ArtistRevenueRank
    FROM artist_perf
),

-- Country behavior (customers + invoices)
country_behavior AS (
    SELECT
        c.Country,
        COUNT(*) AS Customers,
        SUM(CASE WHEN cim.InvoiceCount > 1 THEN 1 ELSE 0 END) AS RepeatCustomers,
        AVG(CAST(COALESCE(cim.InvoiceCount, 0) AS DECIMAL(18,2))) AS AvgInvoicesPerCustomer,
        SUM(CAST(COALESCE(cim.LifetimeValue, 0) AS DECIMAL(18,2))) AS CountryRevenue
    FROM Customer c
    LEFT JOIN customer_invoice_metrics cim
        ON cim.CustomerId = c.CustomerId
    GROUP BY c.Country
),

ranked_countries AS (
    SELECT
        Country,
        Customers,
        RepeatCustomers,
        CAST(1.0 * RepeatCustomers / NULLIF(Customers, 0) AS DECIMAL(10,4)) AS RepeatCustomerPct,
        AvgInvoicesPerCustomer,
        CountryRevenue,
        RANK() OVER (ORDER BY CountryRevenue DESC) AS CountryRevenueRank
    FROM country_behavior
),

-- FINAL MASTER TABLE (per customer) with extra scalar/correlated/subquery examples
master_customer_kpis AS (
    SELECT
        cr.CustomerId,
        cr.FirstName,
        cr.LastName,
        cr.Country,

        cr.InvoiceCount,
        cr.LifetimeValue,
        cr.AvgInvoiceValue,
        cr.FirstPurchaseDate,
        cr.LastPurchaseDate,
        cr.DaysSinceLastPurchase,
        cr.RetentionStage,

        -- Join country ranks
        rc.CountryRevenue,
        rc.CountryRevenueRank,
        rc.RepeatCustomerPct,

        -- Correlated subquery example: customer revenue share within their country
        CAST(
            1.0 * COALESCE(cr.LifetimeValue, 0)
            / NULLIF((
                SELECT SUM(COALESCE(cim2.LifetimeValue, 0))
                FROM customer_invoice_metrics cim2
                WHERE cim2.Country = cr.Country
            ), 0)
            AS DECIMAL(10,4)
        ) AS CountryRevenueShare,

        -- Scalar subquery example: global total revenue (same value for all rows)
        (SELECT SUM(CAST(Total AS DECIMAL(18,2))) FROM Invoice) AS GlobalTotalRevenue,

        -- IN/NOT IN example: flag customers with 0 purchases
        CASE
            WHEN cr.CustomerId NOT IN (SELECT DISTINCT CustomerId FROM Invoice) THEN 1
            ELSE 0
        END AS IsNeverPurchased
    FROM customer_retention cr
    LEFT JOIN ranked_countries rc
        ON rc.Country = cr.Country
)

 
-- OUTPUT 1) Top customers by lifetime value
 
SELECT TOP 20
    CustomerId,
    FirstName,
    LastName,
    Country,
    InvoiceCount,
    LifetimeValue,
    AvgInvoiceValue,
    LastPurchaseDate,
    RANK() OVER (ORDER BY COALESCE(LifetimeValue, 0) DESC) AS LTVRank
FROM customer_invoice_metrics
ORDER BY COALESCE(LifetimeValue, 0) DESC, LastName, FirstName;

 
-- OUTPUT 2) Customer retention stages (counts + sample list)
 
SELECT
    RetentionStage,
    COUNT(*) AS Customers
FROM customer_retention
GROUP BY RetentionStage
ORDER BY Customers DESC;

SELECT TOP 50
    CustomerId,
    FirstName,
    LastName,
    Country,
    InvoiceCount,
    LifetimeValue,
    LastPurchaseDate,
    DaysSinceLastPurchase,
    RetentionStage
FROM customer_retention
ORDER BY
    CASE RetentionStage
        WHEN 'Loyal (4+)' THEN 1
        WHEN 'Repeat (2-3)' THEN 2
        WHEN 'New (1 purchase)' THEN 3
        WHEN 'Churned (inactive 12m)' THEN 4
        WHEN 'No purchases' THEN 5
        ELSE 6
    END,
    COALESCE(LifetimeValue, 0) DESC;

 
-- OUTPUT 3) Top-performing genres and artists
 
SELECT TOP 10
    GenreName,
    GenreRevenue,
    UnitsSold,
    GenreRevenueRank
FROM ranked_genres
ORDER BY GenreRevenue DESC;

SELECT TOP 10
    ArtistName,
    ArtistRevenue,
    UnitsSold,
    ArtistRevenueRank
FROM ranked_artists
ORDER BY ArtistRevenue DESC;

 
-- OUTPUT 4) Revenue trends over time (calendar months + running total + MoM)
 
SELECT
    MonthStart,
    MonthlyRevenue,
    PrevMonthRevenue,
    CAST(
        (MonthlyRevenue - PrevMonthRevenue) / NULLIF(PrevMonthRevenue, 0.0)
        AS DECIMAL(10,4)
    ) AS MoMChangeRate,
    RunningTotalRevenue
FROM revenue_trends
ORDER BY MonthStart
OPTION (MAXRECURSION 2000);

 
-- OUTPUT 5) Country purchase behavior patterns
 
SELECT
    Country,
    Customers,
    RepeatCustomers,
    RepeatCustomerPct,
    AvgInvoicesPerCustomer,
    CountryRevenue,
    CountryRevenueRank
FROM ranked_countries
ORDER BY CountryRevenue DESC, Country;

 
-- OUTPUT 6) FINAL MASTER TABLE (all KPIs combined per customer)
 
SELECT
    CustomerId,
    FirstName,
    LastName,
    Country,
    InvoiceCount,
    LifetimeValue,
    AvgInvoiceValue,
    FirstPurchaseDate,
    LastPurchaseDate,
    DaysSinceLastPurchase,
    RetentionStage,
    CountryRevenue,
    CountryRevenueRank,
    RepeatCustomerPct,
    CountryRevenueShare,
    GlobalTotalRevenue,
    IsNeverPurchased
FROM master_customer_kpis
ORDER BY
    COALESCE(LifetimeValue, 0) DESC,
    LastName,
    FirstName;





