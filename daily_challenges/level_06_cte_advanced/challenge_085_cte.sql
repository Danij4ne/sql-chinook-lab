
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

WITH monthly_sales AS (
    SELECT
        YEAR(InvoiceDate)  AS [Year],
        MONTH(InvoiceDate) AS [Month],
        SUM(Total)         AS MonthlySales
    FROM Invoice
    GROUP BY
        YEAR(InvoiceDate),
        MONTH(InvoiceDate)
)
SELECT
    [Year],
    [Month],
    MonthlySales
FROM monthly_sales
ORDER BY
    [Year],
    [Month];
