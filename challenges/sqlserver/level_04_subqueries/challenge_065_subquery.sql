
-- CHALLENGE 065 - INVOICES ABOVE GLOBAL AVERAGE TOTAL
-- Difficulty: MEDIUM
-- Topic: SCALAR SUBQUERY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve invoices whose total is greater than the global average invoice total.
-- This challenge focuses on comparing invoice totals to a scalar subquery.

-- REQUIREMENTS:
--   1. Select the following columns from the Invoice table:
--        - InvoiceId
--        - InvoiceDate
--        - Total
--   2. Use a subquery to compute the average Total across all invoices.
--   3. Return only invoices where Total is greater than this average.
--   4. Sort results by Total in descending order.

SELECT 
    InvoiceId,
    InvoiceDate,
    Total
FROM Invoice
WHERE Total > (
    SELECT AVG(Total)
    FROM Invoice
)
ORDER BY Total DESC;
