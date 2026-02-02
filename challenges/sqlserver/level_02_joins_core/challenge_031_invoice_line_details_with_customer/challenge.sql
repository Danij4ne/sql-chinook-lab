

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

