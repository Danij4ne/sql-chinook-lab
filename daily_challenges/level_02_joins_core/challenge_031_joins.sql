
-- CHALLENGE 031 - INVOICE DETAILS WITH CUSTOMER NAME
-- Difficulty: EASY
-- Topic: MULTI JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve invoice line items along with the invoice date and customer full name.
-- This challenge focuses on combining InvoiceLine, Invoice, and Customer.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - InvoiceLine.InvoiceLineId
--        - Invoice.InvoiceDate
--        - Customer.FirstName
--        - Customer.LastName
--        - InvoiceLine.UnitPrice
--        - InvoiceLine.Quantity
--   2. Join InvoiceLine → Invoice using InvoiceId.
--   3. Join Invoice → Customer using CustomerId.
--   4. Sort the results by InvoiceDate in descending order.

SELECT
    il.InvoiceLineId,
    i.InvoiceDate,
    c.FirstName,
    c.LastName,
    il.UnitPrice,
    il.Quantity
FROM InvoiceLine il
INNER JOIN Invoice i
    ON il.InvoiceId = i.InvoiceId
INNER JOIN Customer c
    ON i.CustomerId = c.CustomerId
ORDER BY
    i.InvoiceDate DESC;
