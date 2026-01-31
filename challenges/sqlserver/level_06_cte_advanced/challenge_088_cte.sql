
-- CHALLENGE 088 - CTE FOR CUSTOMER INVOICE DETAILS
-- Difficulty: MEDIUM
-- Topic: CTE + JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Use a CTE to pre-calculate invoice totals per customer and join it with the Customer table.

-- REQUIREMENTS:
--   1. Create a CTE that:
--        - From Invoice, selects:
--             - CustomerId
--             - COUNT(InvoiceId) AS InvoiceCount
--             - SUM(Total) AS TotalSpent
--        - Groups by CustomerId.
--   2. In the main query:
--        - Join this CTE with the Customer table.
--        - Select:
--             - Customer.CustomerId
--             - Customer.FirstName
--             - Customer.LastName
--             - InvoiceCount
--             - TotalSpent
--   3. Order results by TotalSpent in descending order.

WITH customer_invoices AS (
    SELECT
        CustomerId,
        COUNT(InvoiceId) AS InvoiceCount,
        SUM(Total)      AS TotalSpent
    FROM Invoice
    GROUP BY
        CustomerId
)
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    ci.InvoiceCount,
    ci.TotalSpent
FROM Customer c
JOIN customer_invoices ci
    ON ci.CustomerId = c.CustomerId
ORDER BY
    ci.TotalSpent DESC;