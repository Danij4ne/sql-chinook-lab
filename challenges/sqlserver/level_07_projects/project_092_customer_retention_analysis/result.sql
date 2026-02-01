


-- 0) Reference date (max InvoiceDate in dataset)
 
WITH ref AS (
    SELECT MAX(InvoiceDate) AS MaxInvoiceDate
    FROM Invoice
)
SELECT MaxInvoiceDate
FROM ref;


-- 1) Active vs Inactive customers + Retention rate
-- Active = at least 1 purchase in the last 12 months from MaxInvoiceDate
 
WITH ref AS (
    SELECT MAX(InvoiceDate) AS MaxInvoiceDate
    FROM Invoice
),
customer_last_purchase AS (
    SELECT
        i.CustomerId,
        MAX(i.InvoiceDate) AS LastPurchaseDate
    FROM Invoice i
    GROUP BY i.CustomerId
),
customer_status AS (
    SELECT
        clp.CustomerId,
        clp.LastPurchaseDate,
        CASE
            WHEN clp.LastPurchaseDate >= DATEADD(MONTH, -12, r.MaxInvoiceDate) THEN 1
            ELSE 0
        END AS IsActive
    FROM customer_last_purchase clp
    CROSS JOIN ref r
)
SELECT
    SUM(CASE WHEN IsActive = 1 THEN 1 ELSE 0 END) AS TotalActiveCustomers,
    SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) AS TotalInactiveCustomers,
    CAST(
        1.0 * SUM(CASE WHEN IsActive = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,4)
    ) AS RetentionRate
FROM customer_status;


-- 2) Customers who purchased only once vs more than once
 
WITH purchase_counts AS (
    SELECT
        CustomerId,
        COUNT(*) AS InvoiceCount
    FROM Invoice
    GROUP BY CustomerId
)
SELECT
    CASE
        WHEN InvoiceCount = 1 THEN 'Only once'
        ELSE 'More than once'
    END AS PurchaseFrequency,
    COUNT(*) AS Customers
FROM purchase_counts
GROUP BY
    CASE
        WHEN InvoiceCount = 1 THEN 'Only once'
        ELSE 'More than once'
    END
ORDER BY Customers DESC;


-- 3) Customers who purchased in consecutive years

WITH customer_years AS (
    SELECT DISTINCT
        CustomerId,
        YEAR(InvoiceDate) AS [Year]
    FROM Invoice
),
consecutive_flag AS (
    SELECT
        cy.CustomerId,
        MAX(CASE WHEN cy2.CustomerId IS NOT NULL THEN 1 ELSE 0 END) AS HasConsecutiveYears
    FROM customer_years cy
    LEFT JOIN customer_years cy2
        ON cy2.CustomerId = cy.CustomerId
       AND cy2.[Year] = cy.[Year] + 1
    GROUP BY cy.CustomerId
)
SELECT
    HasConsecutiveYears,
    COUNT(*) AS Customers
FROM consecutive_flag
GROUP BY HasConsecutiveYears
ORDER BY HasConsecutiveYears DESC;

-- 4) Year-over-year retention trend
-- For each year Y: % of customers from Y who also bought in Y+1
 
WITH customer_years AS (
    SELECT DISTINCT
        CustomerId,
        YEAR(InvoiceDate) AS [Year]
    FROM Invoice
),
yoy AS (
    SELECT
        cy.[Year] AS [Year],
        COUNT(DISTINCT cy.CustomerId) AS CustomersInYear,
        COUNT(DISTINCT CASE WHEN cy_next.CustomerId IS NOT NULL THEN cy.CustomerId END) AS RetainedNextYear
    FROM customer_years cy
    LEFT JOIN customer_years cy_next
        ON cy_next.CustomerId = cy.CustomerId
       AND cy_next.[Year] = cy.[Year] + 1
    GROUP BY cy.[Year]
)
SELECT
    [Year],
    CustomersInYear,
    RetainedNextYear,
    CAST(1.0 * RetainedNextYear / NULLIF(CustomersInYear, 0) AS DECIMAL(10,4)) AS YoYRetentionRate
FROM yoy
ORDER BY [Year];

