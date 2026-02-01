

WITH monthly_revenue AS (
    SELECT
        YEAR(i.InvoiceDate)  AS [Year],
        MONTH(i.InvoiceDate) AS [Month],
        SUM(CAST(i.Total AS DECIMAL(18,2))) AS MonthlyRevenue
    FROM Invoice i
    GROUP BY
        YEAR(i.InvoiceDate),
        MONTH(i.InvoiceDate)
),
yearly_revenue AS (
    SELECT
        [Year],
        SUM(MonthlyRevenue) AS YearRevenue,
        AVG(MonthlyRevenue) AS AvgMonthlyRevenue
    FROM monthly_revenue
    GROUP BY [Year]
),
yoy AS (
    SELECT
        [Year],
        YearRevenue,
        AvgMonthlyRevenue,
        LAG(YearRevenue) OVER (ORDER BY [Year]) AS PrevYearRevenue
    FROM yearly_revenue
)
SELECT
    (SELECT SUM(CAST(Total AS DECIMAL(18,2))) FROM Invoice) AS TotalRevenue,
    [Year],
    YearRevenue,
    AvgMonthlyRevenue,
    PrevYearRevenue,
    CAST(
        (YearRevenue - PrevYearRevenue) / NULLIF(PrevYearRevenue, 0.0)
        AS DECIMAL(10,4)
    ) AS YoYChangeRate
FROM yoy
ORDER BY [Year];

 
-- 2) Country performance (best-performing countries)
 
WITH country_perf AS (
    SELECT
        i.BillingCountry AS Country,
        SUM(CAST(i.Total AS DECIMAL(18,2))) AS TotalRevenue,
        COUNT(*) AS TotalInvoices,
        AVG(CAST(i.Total AS DECIMAL(18,2))) AS AvgInvoiceValue
    FROM Invoice i
    GROUP BY i.BillingCountry
)
SELECT
    Country,
    TotalRevenue,
    TotalInvoices,
    AvgInvoiceValue,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS CountryRank
FROM country_perf
ORDER BY TotalRevenue DESC, Country;

 
-- 3) Artist performance (best-selling artists)
-- Revenue comes from InvoiceLine * Track (Album -> Artist)
 
WITH artist_perf AS (
    SELECT
        ar.ArtistId,
        ar.Name AS ArtistName,
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS TotalRevenue,
        SUM(CAST(il.Quantity AS INT)) AS UnitsSold
    FROM InvoiceLine il
    JOIN Track t
        ON t.TrackId = il.TrackId
    JOIN Album al
        ON al.AlbumId = t.AlbumId
    JOIN Artist ar
        ON ar.ArtistId = al.ArtistId
    GROUP BY
        ar.ArtistId, ar.Name
)
SELECT
    ArtistId,
    ArtistName,
    TotalRevenue,
    UnitsSold,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS ArtistRank
FROM artist_perf
ORDER BY TotalRevenue DESC, ArtistName;

 
-- 4) Genre performance (best-selling genres)
 
WITH genre_perf AS (
    SELECT
        g.GenreId,
        g.Name AS GenreName,
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS TotalRevenue,
        SUM(CAST(il.Quantity AS INT)) AS UnitsSold
    FROM InvoiceLine il
    JOIN Track t
        ON t.TrackId = il.TrackId
    JOIN Genre g
        ON g.GenreId = t.GenreId
    GROUP BY
        g.GenreId, g.Name
)
SELECT
    GenreId,
    GenreName,
    TotalRevenue,
    UnitsSold,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS GenreRank
FROM genre_perf
ORDER BY TotalRevenue DESC, GenreName;

 
-- 5) Strongest seasonal months (across all years)
-- Finds which month number (1-12) brings the most revenue overall
 
WITH month_perf AS (
    SELECT
        MONTH(i.InvoiceDate) AS [Month],
        SUM(CAST(i.Total AS DECIMAL(18,2))) AS TotalRevenue,
        AVG(CAST(i.Total AS DECIMAL(18,2))) AS AvgInvoiceValue,
        COUNT(*) AS TotalInvoices
    FROM Invoice i
    GROUP BY MONTH(i.InvoiceDate)
)
SELECT
    [Month],
    TotalRevenue,
    TotalInvoices,
    AvgInvoiceValue,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS SeasonMonthRank
FROM month_perf
ORDER BY TotalRevenue DESC, [Month];

 
-- 6) Revenue by Year-Month (for dashboards / trend charts)
 
SELECT
    YEAR(i.InvoiceDate)  AS [Year],
    MONTH(i.InvoiceDate) AS [Month],
    SUM(CAST(i.Total AS DECIMAL(18,2))) AS MonthlyRevenue
FROM Invoice i
GROUP BY
    YEAR(i.InvoiceDate),
    MONTH(i.InvoiceDate)
ORDER BY
    [Year],
    [Month];

    