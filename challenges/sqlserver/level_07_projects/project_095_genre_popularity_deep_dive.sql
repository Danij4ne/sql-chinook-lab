
-- PROJECT 095 - GENRE POPULARITY DEEP DIVE
-- Difficulty: PROJECT
-- Database: Chinook

-- DESCRIPTION:
-- Analyze the popularity and performance of each music genre.

-- REQUIREMENTS:
--   1. For each genre calculate:
--        - Track count
--        - Total sales
--        - Average duration
--        - Average price
--   2. Rank genres by revenue.
--   3. Identify:
--        - Top 3 genres
--        - Bottom 3 genres
--   4. Detect outlier genres with unusually high/low track counts.

-- WRITE YOUR SQL SOLUTION BELOW THIS LINE:
--
--
--
 
 
-- 1) Genre performance table + Revenue rank + TrackCount outlier flag
 
WITH genre_base AS (
    SELECT
        g.GenreId,
        g.Name AS GenreName,

        COUNT(DISTINCT t.TrackId) AS TrackCount,

        -- Revenue from sales (some tracks may not be sold -> LEFT JOIN)
        COALESCE(SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))), 0) AS TotalSales,

        AVG(CAST(t.Milliseconds AS DECIMAL(18,2))) AS AvgDurationMs,
        AVG(CAST(t.UnitPrice     AS DECIMAL(18,2))) AS AvgPrice
    FROM Genre g
    JOIN Track t
        ON t.GenreId = g.GenreId
    LEFT JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    GROUP BY
        g.GenreId, g.Name
),
stats AS (
    SELECT
        AVG(CAST(TrackCount AS DECIMAL(18,4))) AS MeanTrackCount,
        STDEV(CAST(TrackCount AS DECIMAL(18,4))) AS StdTrackCount
    FROM genre_base
),
ranked AS (
    SELECT
        gb.GenreId,
        gb.GenreName,
        gb.TrackCount,
        gb.TotalSales,
        gb.AvgDurationMs,
        gb.AvgPrice,
        RANK() OVER (ORDER BY gb.TotalSales DESC) AS RevenueRank,

        -- Outlier detection: mean ± 2*std (z-score style)
        CASE
            WHEN s.StdTrackCount IS NULL OR s.StdTrackCount = 0 THEN 'Normal'
            WHEN gb.TrackCount > s.MeanTrackCount + (2 * s.StdTrackCount) THEN 'High track-count outlier'
            WHEN gb.TrackCount < s.MeanTrackCount - (2 * s.StdTrackCount) THEN 'Low track-count outlier'
            ELSE 'Normal'
        END AS TrackCountOutlierFlag
    FROM genre_base gb
    CROSS JOIN stats s
)
SELECT
    GenreName,
    TrackCount,
    TotalSales,
    AvgDurationMs,
    AvgPrice,
    RevenueRank,
    TrackCountOutlierFlag
FROM ranked
ORDER BY
    TotalSales DESC, GenreName;


-- 2) Top 3 genres by revenue
 
WITH genre_sales AS (
    SELECT
        g.Name AS GenreName,
        COALESCE(SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))), 0) AS TotalSales
    FROM Genre g
    JOIN Track t ON t.GenreId = g.GenreId
    LEFT JOIN InvoiceLine il ON il.TrackId = t.TrackId
    GROUP BY g.Name
)
SELECT TOP 3
    GenreName,
    TotalSales
FROM genre_sales
ORDER BY
    TotalSales DESC, GenreName;


-- 3) Bottom 3 genres by revenue
 
WITH genre_sales AS (
    SELECT
        g.Name AS GenreName,
        COALESCE(SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))), 0) AS TotalSales
    FROM Genre g
    JOIN Track t ON t.GenreId = g.GenreId
    LEFT JOIN InvoiceLine il ON il.TrackId = t.TrackId
    GROUP BY g.Name
)
SELECT TOP 3
    GenreName,
    TotalSales
FROM genre_sales
ORDER BY
    TotalSales ASC, GenreName;
