
-- CHALLENGE 075 - LAG FUNCTION FOR INVOICE TOTALS
-- Difficulty: MEDIUM
-- Topic: LAG()
-- Database: Chinook

-- DESCRIPTION:
-- Compare each invoice's total with the previous invoice's total.

-- REQUIREMENTS:
--   1. Select InvoiceId, InvoiceDate, Total.
--   2. Use LAG(Total) OVER (ORDER BY InvoiceDate) AS PreviousTotal.
--   3. Order results by InvoiceDate.
