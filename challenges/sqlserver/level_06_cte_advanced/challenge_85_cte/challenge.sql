

-- CHALLENGE 085 - CTE FOR MONTHLY SALES
-- Difficulty: MEDIUM
-- Topic: CTE + DATE FUNCTIONS
-- Database: Chinook

-- DESCRIPTION:
-- Use a CTE to calculate monthly sales totals.

-- REQUIREMENTS:
--   1. Create a CTE that:
--        - From Invoice, extracts the year and month from InvoiceDate.
--        - Groups by year and month.
--        - Calculates SUM(Total) AS MonthlySales.
--   2. In the main query, select:
--        - Year
--        - Month
--        - MonthlySales
--   3. Order results by Year, then Month.
