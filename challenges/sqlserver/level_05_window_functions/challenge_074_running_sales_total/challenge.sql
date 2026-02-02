

-- CHALLENGE 074 - RUNNING TOTAL OF INVOICE SALES
-- Difficulty: MEDIUM
-- Topic: SUM() OVER()
-- Database: Chinook

-- DESCRIPTION:
-- Compute a running total of invoice sales over time.

-- REQUIREMENTS:
--   1. Select InvoiceId, InvoiceDate, Total.
--   2. Use SUM(Total) OVER (ORDER BY InvoiceDate) AS RunningTotal.
--   3. Order final results by InvoiceDate.
