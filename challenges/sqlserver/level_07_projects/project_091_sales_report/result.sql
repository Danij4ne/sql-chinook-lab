

-- 1) GLOBAL KPIs (1 row)
 
SELECT
    SUM(i.Total)                           AS TotalGlobalSales,
    COUNT(*)                               AS TotalInvoices,
    AVG(CAST(i.Total AS DECIMAL(18,2)))    AS AverageInvoiceValue,
    MAX(i.Total)                           AS HighestInvoiceTotal,
    MIN(i.Total)                           AS LowestInvoiceTotal
FROM Invoice i;


-- 2) TOP 10 HIGHEST-SPENDING CUSTOMERS
 
WITH customer_spending AS (
    SELECT
        c.CustomerId,
        c.FirstName,
        c.LastName,
        SUM(i.Total) AS TotalSpent
    FROM Customer c
    JOIN Invoice i
        ON i.CustomerId = c.CustomerId
    GROUP BY
        c.CustomerId, c.FirstName, c.LastName
)
SELECT TOP 10
    CustomerId,
    FirstName,
    LastName,
    TotalSpent
FROM customer_spending
ORDER BY
    TotalSpent DESC;


 
-- 3) SALES AGGREGATED BY Country + Year + Month
 
SELECT
    i.BillingCountry                       AS Country,
    YEAR(i.InvoiceDate)                    AS [Year],
    MONTH(i.InvoiceDate)                   AS [Month],
    SUM(i.Total)                           AS Sales
FROM Invoice i
GROUP BY
    i.BillingCountry,
    YEAR(i.InvoiceDate),
    MONTH(i.InvoiceDate)
ORDER BY
    Country,
    [Year],
    [Month];


 
-- 4) COUNTRIES RANKED BY TOTAL SALES
 
WITH country_sales AS (
    SELECT
        i.BillingCountry AS Country,
        SUM(i.Total)     AS TotalSales
    FROM Invoice i
    GROUP BY
        i.BillingCountry
),
ranked_countries AS (
    SELECT
        Country,
        TotalSales,
        RANK() OVER (ORDER BY TotalSales DESC) AS CountryRank
    FROM country_sales
)
SELECT
    CountryRank,
    Country,
    TotalSales
FROM ranked_countries
ORDER BY
    CountryRank, Country;


-- 5) CUSTOMERS RANKED BY TOTAL SPENDING
 
WITH customer_sales AS (
    SELECT
        c.CustomerId,
        c.FirstName,
        c.LastName,
        SUM(i.Total) AS TotalSpent
    FROM Customer c
    JOIN Invoice i
        ON i.CustomerId = c.CustomerId
    GROUP BY
        c.CustomerId, c.FirstName, c.LastName
),
ranked_customers AS (
    SELECT
        CustomerId,
        FirstName,
        LastName,
        TotalSpent,
        RANK() OVER (ORDER BY TotalSpent DESC) AS CustomerRank
    FROM customer_sales
)
SELECT
    CustomerRank,
    CustomerId,
    FirstName,
    LastName,
    TotalSpent
FROM ranked_customers
ORDER BY
    CustomerRank, LastName, FirstName;


 
-- 6) MONTHLY REVENUE TREND (Year-Month)
 
WITH monthly_revenue AS (
    SELECT
        YEAR(i.InvoiceDate)  AS [Year],
        MONTH(i.InvoiceDate) AS [Month],
        SUM(i.Total)         AS MonthlySales
    FROM Invoice i
    GROUP BY
        YEAR(i.InvoiceDate),
        MONTH(i.InvoiceDate)
)
SELECT
    [Year],
    [Month],
    MonthlySales
FROM monthly_revenue
ORDER BY
    [Year],
    [Month];

