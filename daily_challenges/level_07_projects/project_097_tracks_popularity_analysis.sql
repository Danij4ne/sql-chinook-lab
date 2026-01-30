
-- PROJECT 097 - TRACK POPULARITY ANALYSIS
-- Difficulty: PROJECT
-- Database: Chinook

-- DESCRIPTION:
-- Analyze track popularity and purchasing patterns.

-- REQUIREMENTS:
--   1. For each track calculate:
--        - Purchase count
--        - Total revenue
--        - Average price
--   2. Rank tracks by:
--        - Revenue
--        - Purchases
--        - Unit price
--   3. Identify:
--        - Top 20 tracks
--        - Tracks never purchased
--   4. Compare popularity against:
--        - Genre
--        - MediaType

-- WRITE YOUR SQL SOLUTION BELOW THIS LINE:
--
--
--

WITH track_sales AS (
    SELECT
        t.TrackId,
        t.Name AS TrackName,
        g.Name AS Genre,
        mt.Name AS MediaType,

        -- If never purchased, these will be NULL -> COALESCE to 0 later
        SUM(CAST(il.Quantity AS INT)) AS PurchaseCount,
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS TotalRevenue,
        AVG(CAST(il.UnitPrice AS DECIMAL(18,2))) AS AvgSoldPrice,

        AVG(CAST(t.UnitPrice AS DECIMAL(18,2))) AS CatalogUnitPrice
    FROM Track t
    JOIN Genre g
        ON g.GenreId = t.GenreId
    JOIN MediaType mt
        ON mt.MediaTypeId = t.MediaTypeId
    LEFT JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    GROUP BY
        t.TrackId, t.Name, g.Name, mt.Name
),
ranked_tracks AS (
    SELECT
        TrackId,
        TrackName,
        Genre,
        MediaType,
        COALESCE(PurchaseCount, 0) AS PurchaseCount,
        COALESCE(TotalRevenue, 0)  AS TotalRevenue,
        AvgSoldPrice,
        CatalogUnitPrice,

        RANK() OVER (ORDER BY COALESCE(TotalRevenue, 0) DESC)  AS RevenueRank,
        RANK() OVER (ORDER BY COALESCE(PurchaseCount, 0) DESC) AS PurchasesRank,
        RANK() OVER (ORDER BY CatalogUnitPrice DESC)           AS UnitPriceRank
    FROM track_sales
)
SELECT TOP 20
    TrackId,
    TrackName,
    Genre,
    MediaType,
    PurchaseCount,
    TotalRevenue,
    AvgSoldPrice,
    CatalogUnitPrice,
    RevenueRank,
    PurchasesRank,
    UnitPriceRank
FROM ranked_tracks
ORDER BY
    RevenueRank, TrackName;

 
-- 2) Tracks never purchased
 
SELECT
    t.TrackId,
    t.Name AS TrackName,
    g.Name  AS Genre,
    mt.Name AS MediaType,
    t.UnitPrice AS CatalogUnitPrice
FROM Track t
JOIN Genre g
    ON g.GenreId = t.GenreId
JOIN MediaType mt
    ON mt.MediaTypeId = t.MediaTypeId
LEFT JOIN InvoiceLine il
    ON il.TrackId = t.TrackId
WHERE il.TrackId IS NULL
ORDER BY
    TrackName;


 
-- 3) Compare popularity by Genre
-- (Total purchases + revenue + averages)
 
WITH genre_popularity AS (
    SELECT
        g.Name AS Genre,
        SUM(CAST(il.Quantity AS INT)) AS TotalPurchases,
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS TotalRevenue,
        AVG(CAST(il.UnitPrice AS DECIMAL(18,2))) AS AvgSoldPrice
    FROM InvoiceLine il
    JOIN Track t
        ON t.TrackId = il.TrackId
    JOIN Genre g
        ON g.GenreId = t.GenreId
    GROUP BY
        g.Name
)
SELECT
    Genre,
    TotalPurchases,
    TotalRevenue,
    AvgSoldPrice,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS GenreRevenueRank
FROM genre_popularity
ORDER BY
    TotalRevenue DESC, Genre;

 
-- 4) Compare popularity by MediaType
 
WITH mediatype_popularity AS (
    SELECT
        mt.Name AS MediaType,
        SUM(CAST(il.Quantity AS INT)) AS TotalPurchases,
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS TotalRevenue,
        AVG(CAST(il.UnitPrice AS DECIMAL(18,2))) AS AvgSoldPrice
    FROM InvoiceLine il
    JOIN Track t
        ON t.TrackId = il.TrackId
    JOIN MediaType mt
        ON mt.MediaTypeId = t.MediaTypeId
    GROUP BY
        mt.Name
)
SELECT
    MediaType,
    TotalPurchases,
    TotalRevenue,
    AvgSoldPrice,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS MediaTypeRevenueRank
FROM mediatype_popularity
ORDER BY
    TotalRevenue DESC, MediaType;

 

