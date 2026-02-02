

-- CHALLENGE 045 - INVOICE LINE COUNT PER INVOICE
-- Difficulty: MEDIUM
-- Topic: GROUP BY + COUNT
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve each invoice along with how many invoice line items it contains.
-- This challenge focuses on grouping invoice lines by invoice.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - InvoiceId
--        - COUNT(InvoiceLineId) AS LineCount
--   2. From the InvoiceLine table.
--   3. Group results by InvoiceId.
--   4. Sort results by LineCount in descending order.
