
-- CHALLENGE 034 - TOP SELLING ARTISTS
-- Difficulty: EASY
-- Topic: JOIN + AGGREGATION
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve the artists ranked by total sales generated from their tracks.
-- This challenge focuses on joining multiple tables and summing invoice line amounts.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Artist.Name AS ArtistName
--        - SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS TotalSales
--   2. Join Artist → Album using ArtistId.
--   3. Join Album → Track using AlbumId.
--   4. Join Track → InvoiceLine using TrackId.
--   5. Group results by ArtistName.
--   6. Sort the results by TotalSales in descending order.

SELECT
    ar.Name AS ArtistName,
    SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Artist ar
INNER JOIN Album al
    ON ar.ArtistId = al.ArtistId
INNER JOIN Track t
    ON al.AlbumId = t.AlbumId
INNER JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
GROUP BY
    ar.Name
ORDER BY
    TotalSales DESC;
