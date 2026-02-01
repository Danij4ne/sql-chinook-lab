

WITH country_revenue AS (
    SELECT
        i.BillingCountry AS Country,
        SUM(i.Total)     AS TotalRevenue
    FROM Invoice i
    GROUP BY
        i.BillingCountry
),
global_avg AS (
    -- "Global average" interpreted as: average revenue per country
    SELECT
        AVG(CAST(TotalRevenue AS DECIMAL(18,2))) AS AvgRevenuePerCountry
    FROM country_revenue
),
summary AS (
    SELECT
        cr.Country,
        cr.TotalRevenue,
        ga.AvgRevenuePerCountry,
        CASE
            WHEN cr.TotalRevenue > ga.AvgRevenuePerCountry * 1.20 THEN 'High revenue'
            WHEN cr.TotalRevenue < ga.AvgRevenuePerCountry * 0.80 THEN 'Low revenue'
            ELSE 'Medium revenue'
        END AS RevenueSegment,
        RANK() OVER (ORDER BY cr.TotalRevenue DESC) AS RevenueRankDesc
    FROM country_revenue cr
    CROSS JOIN global_avg ga
)
SELECT
    Country,
    TotalRevenue,
    AvgRevenuePerCountry,
    RevenueSegment,
    RevenueRankDesc
FROM summary
ORDER BY
    TotalRevenue DESC, Country;


-- 2) Top 5 countries by revenue
 
WITH country_revenue AS (
    SELECT
        BillingCountry AS Country,
        SUM(Total)     AS TotalRevenue
    FROM Invoice
    GROUP BY BillingCountry
)
SELECT TOP 5
    Country,
    TotalRevenue
FROM country_revenue
ORDER BY
    TotalRevenue DESC, Country;


-- 3) Bottom 5 countries by revenue
 
WITH country_revenue AS (
    SELECT
        BillingCountry AS Country,
        SUM(Total)     AS TotalRevenue
    FROM Invoice
    GROUP BY BillingCountry
)
SELECT TOP 5
    Country,
    TotalRevenue
FROM country_revenue
ORDER BY
    TotalRevenue ASC, Country;
