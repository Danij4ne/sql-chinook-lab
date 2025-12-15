
-- CHALLENGE 020 - CUSTOMER INVOICE TOTALS
-- Difficulty: EASY
-- Topic: INNER JOIN + MULTI JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve each customer's invoices together with the number of invoice lines each invoice contains.
-- This challenge focuses on joining multiple related tables.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Customer.FirstName
--        - Customer.LastName
--        - Invoice.InvoiceId
--        - COUNT(InvoiceLine.InvoiceLineId) AS LineCount
--   2. Join Customer → Invoice using CustomerId.
--   3. Join Invoice → InvoiceLine using InvoiceId.
--   4. Group the results by:
--        - Customer.FirstName
--        - Customer.LastName
--        - Invoice.InvoiceId
--   5. Sort the results by LineCount in descending order.

SELECT 
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    COUNT(inv.InvoiceLineId) AS LineCount
FROM Customer c
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
JOIN InvoiceLine inv
    ON inv.InvoiceId = i.InvoiceId
GROUP BY
    c.FirstName,
    c.LastName,
    i.InvoiceId
ORDER BY
    LineCount DESC;
