

WITH artist_base AS (
    SELECT
        ar.ArtistId,
        ar.Name AS ArtistName,

        -- Catalog size
        COUNT(DISTINCT al.AlbumId) AS TotalAlbums,
        COUNT(DISTINCT t.TrackId)  AS TotalTracks,

        -- Revenue: only when tracks were sold
        SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))) AS TotalSales,

        -- Average track price (catalog price)
        AVG(CAST(t.UnitPrice AS DECIMAL(18,2))) AS AvgTrackPrice
    FROM Artist ar
    JOIN Album al
        ON al.ArtistId = ar.ArtistId
    JOIN Track t
        ON t.AlbumId = al.AlbumId
    LEFT JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    GROUP BY
        ar.ArtistId,
        ar.Name
),
ranked_artists AS (
    SELECT
        ArtistId,
        ArtistName,
        TotalAlbums,
        TotalTracks,
        COALESCE(TotalSales, 0) AS TotalSales,
        AvgTrackPrice,

        -- Rank by sales (main)
        RANK() OVER (ORDER BY COALESCE(TotalSales, 0) DESC) AS SalesRank,

        -- Additional rankings
        RANK() OVER (ORDER BY TotalTracks DESC)             AS TracksRank,
        RANK() OVER (ORDER BY AvgTrackPrice DESC)           AS AvgPriceRank
    FROM artist_base
)
SELECT TOP 20
    ArtistId,
    ArtistName,
    TotalAlbums,
    TotalTracks,
    TotalSales,
    AvgTrackPrice,
    SalesRank,
    TracksRank,
    AvgPriceRank
FROM ranked_artists
ORDER BY
    SalesRank, ArtistName;
