
-- CHALLENGE 022 - INVOICES WITH CUSTOMER INFORMATION
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve invoices together with the customer’s full name.
-- This challenge focuses on combining invoice data with customer identity.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Invoice.InvoiceId
--        - Invoice.InvoiceDate
--        - Invoice.Total
--        - Customer.FirstName
--        - Customer.LastName
--   2. Join Invoice → Customer using CustomerId.
--   3. Sort the results by InvoiceDate in descending order.

SELECT
    i.invoiceid,
    i.invoicedate,
    i.total,
    c.firstname,
    c.lastname
FROM invoice i
JOIN customer c
    ON i.customerid = c.customerid
ORDER BY i.invoicedate DESC;

