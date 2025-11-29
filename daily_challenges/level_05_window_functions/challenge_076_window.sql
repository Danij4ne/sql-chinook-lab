
-- CHALLENGE 076 - LEAD FUNCTION FOR INVOICE TOTALS
-- Difficulty: MEDIUM
-- Topic: LEAD()
-- Database: Chinook

-- DESCRIPTION:
-- Compare each invoice's total with the next invoice's total.

-- REQUIREMENTS:
--   1. Select InvoiceId, InvoiceDate, Total.
--   2. Use LEAD(Total) OVER (ORDER BY InvoiceDate) AS NextTotal.
--   3. Order results by InvoiceDate.
