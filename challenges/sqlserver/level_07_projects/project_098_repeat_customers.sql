
-- PROJECT 098 - REPEAT CUSTOMERS STUDY
-- Difficulty: PROJECT
-- Database: Chinook

-- DESCRIPTION:
-- Identify and analyze repeat customer behavior.

-- REQUIREMENTS:
--   1. Identify repeat customers (more than 1 invoice).
--   2. Compute:
--        - Invoice count
--        - Total revenue
--        - Average invoice value
--   3. Rank repeat customers by revenue.
--   4. Analyze:
--        - Repeat customer % by country
--        - Purchase frequency patterns

-- WRITE YOUR SQL SOLUTION BELOW THIS LINE:
--
--
--

WITH customer_metrics AS (
    SELECT
        c.CustomerId,
        c.FirstName,
        c.LastName,
        c.Country,
        COUNT(i.InvoiceId)                     AS InvoiceCount,
        SUM(CAST(i.Total AS DECIMAL(18,2)))    AS TotalRevenue,
        AVG(CAST(i.Total AS DECIMAL(18,2)))    AS AvgInvoiceValue
    FROM Customer c
    JOIN Invoice i
        ON i.CustomerId = c.CustomerId
    GROUP BY
        c.CustomerId, c.FirstName, c.LastName, c.Country
),
repeat_customers AS (
    SELECT
        CustomerId,
        FirstName,
        LastName,
        Country,
        InvoiceCount,
        TotalRevenue,
        AvgInvoiceValue,
        RANK() OVER (ORDER BY TotalRevenue DESC) AS RevenueRank
    FROM customer_metrics
    WHERE InvoiceCount > 1
)
SELECT
    CustomerId,
    FirstName,
    LastName,
    Country,
    InvoiceCount,
    TotalRevenue,
    AvgInvoiceValue,
    RevenueRank
FROM repeat_customers
ORDER BY
    TotalRevenue DESC, LastName, FirstName;

 
-- 2) Repeat customer % by country
 
WITH customer_metrics AS (
    SELECT
        c.CustomerId,
        c.Country,
        COUNT(i.InvoiceId) AS InvoiceCount
    FROM Customer c
    JOIN Invoice i
        ON i.CustomerId = c.CustomerId
    GROUP BY
        c.CustomerId, c.Country
),
country_summary AS (
    SELECT
        Country,
        COUNT(*) AS TotalCustomers,
        SUM(CASE WHEN InvoiceCount > 1 THEN 1 ELSE 0 END) AS RepeatCustomers
    FROM customer_metrics
    GROUP BY
        Country
)
SELECT
    Country,
    TotalCustomers,
    RepeatCustomers,
    CAST(1.0 * RepeatCustomers / NULLIF(TotalCustomers, 0) AS DECIMAL(10,4)) AS RepeatCustomerPct
FROM country_summary
ORDER BY
    RepeatCustomerPct DESC, RepeatCustomers DESC, Country;

 
-- 3) Purchase frequency patterns (distribution of InvoiceCount)
-- Shows how many customers have 1 invoice, 2 invoices, 3 invoices, etc.
 
WITH customer_invoice_counts AS (
    SELECT
        c.CustomerId,
        COUNT(i.InvoiceId) AS InvoiceCount
    FROM Customer c
    JOIN Invoice i
        ON i.CustomerId = c.CustomerId
    GROUP BY
        c.CustomerId
)
SELECT
    InvoiceCount,
    COUNT(*) AS Customers
FROM customer_invoice_counts
GROUP BY
    InvoiceCount
ORDER BY
    InvoiceCount ASC;