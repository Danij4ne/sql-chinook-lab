
-- CHALLENGE 052 - TOTAL SALES PER INVOICE MONTH
-- Difficulty: MEDIUM
-- Topic: GROUP BY + DATE FUNCTIONS + SUM
-- Database: Chinook

-- DESCRIPTION:
-- Calculate total invoice sales grouped by the month in which they occurred.
-- This challenge focuses on extracting date parts and aggregating totals.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - MONTH(Invoice.InvoiceDate) AS InvoiceMonth
--        - SUM(Invoice.Total) AS TotalSales
--   2. From the Invoice table.
--   3. Group results by MONTH(Invoice.InvoiceDate).
--   4. Sort results by InvoiceMonth in ascending order.
