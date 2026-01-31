
-- CHALLENGE 028 - INVOICES WITH BILLING COUNTRY
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve invoices along with the billing country's name.
-- This challenge focuses on combining invoice data with country information.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Invoice.InvoiceId
--        - Invoice.InvoiceDate
--        - Invoice.Total
--        - Customer.Country
--   2. Join Invoice → Customer using CustomerId.
--   3. Return only invoices where Total is greater than 10.
--   4. Sort the results by Country, then by Total in descending order.

SELECT
    I.InvoiceId,
    I.InvoiceDate,
    I.Total,
    C.Country
FROM Invoice AS I
INNER JOIN Customer AS C
    ON I.CustomerId = C.CustomerId
WHERE I.Total > 10
ORDER BY
    C.Country,
    I.Total DESC;
