
-- CHALLENGE 084 - CTE FOR GENRE SALES
-- Difficulty: MEDIUM
-- Topic: CTE + SUM
-- Database: Chinook

-- DESCRIPTION:
-- Use a CTE to compute total sales per genre and then show only the top ones.

-- REQUIREMENTS:
--   1. Create a CTE that:
--        - Joins Genre → Track → InvoiceLine.
--        - Calculates SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS TotalSales per genre.
--   2. In the main query, select:
--        - GenreName
--        - TotalSales
--   3. Order by TotalSales in descending order.
--   4. Return only the top 5 genres by TotalSales.


WITH genre_sales AS (
    SELECT
        g.Name AS GenreName,
        SUM(il.UnitPrice * il.Quantity) AS TotalSales
    FROM Genre g
    JOIN Track t
        ON t.GenreId = g.GenreId
    JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    GROUP BY
        g.Name
)
SELECT TOP 5
    GenreName,
    TotalSales
FROM genre_sales
ORDER BY
    TotalSales DESC;

