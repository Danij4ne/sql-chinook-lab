
-- CHALLENGE 044 - AVERAGE INVOICE TOTAL PER COUNTRY
-- Difficulty: MEDIUM
-- Topic: GROUP BY + AVG
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the average invoice total for each billing country.
-- This challenge focuses on grouping invoice data by country and applying AVG.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - BillingCountry
--        - AVG(Total) AS AvgInvoiceTotal
--   2. From the Invoice table.
--   3. Group results by BillingCountry.
--   4. Sort results by AvgInvoiceTotal in descending order.

SELECT 
    i.BillingCountry,
    AVG(i.Total) AS AvgInvoiceTotal
FROM Invoice i
GROUP BY i.BillingCountry
ORDER BY AvgInvoiceTotal DESC;


