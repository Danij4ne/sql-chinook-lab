
-- CHALLENGE 061 - INVOICES WITH TOTAL ABOVE CUSTOMER AVERAGE
-- Difficulty: MEDIUM
-- Topic: CORRELATED SUBQUERY
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve invoices whose total amount is greater than that customer's own average invoice total.
-- This challenge focuses on a correlated subquery referencing the same customer.

-- REQUIREMENTS:
--   1. Select the following columns from the Invoice table:
--        - InvoiceId
--        - CustomerId
--        - InvoiceDate
--        - Total
--   2. Use a correlated subquery on the Invoice table to:
--        - Calculate the average Total per CustomerId.
--   3. Return only invoices where:
--        - Invoice.Total > average total for that same customer.
--   4. Sort results by CustomerId, then InvoiceDate.
 

SELECT
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate,
    i.Total
FROM Invoice i
WHERE i.Total > (
    SELECT AVG(i2.Total)
    FROM Invoice i2
    WHERE i2.CustomerId = i.CustomerId    
)
ORDER BY i.CustomerId, i.InvoiceDate;
