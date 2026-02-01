

WITH album_metrics AS (
    SELECT
        al.AlbumId,
        al.Title AS AlbumTitle,
        ar.Name  AS ArtistName,

        COUNT(DISTINCT t.TrackId) AS TotalTracks,

        COALESCE(SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))), 0) AS TotalRevenue,

        CAST(SUM(CAST(t.Milliseconds AS BIGINT)) AS BIGINT) AS TotalDurationMs
    FROM Album al
    JOIN Artist ar
        ON ar.ArtistId = al.ArtistId
    JOIN Track t
        ON t.AlbumId = al.AlbumId
    LEFT JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    GROUP BY
        al.AlbumId, al.Title, ar.Name
)
SELECT
    AlbumId,
    AlbumTitle,
    ArtistName,
    TotalTracks,
    TotalRevenue,
    CAST(1.0 * TotalRevenue / NULLIF(TotalTracks, 0) AS DECIMAL(18,4)) AS AvgRevenuePerTrack,
    TotalDurationMs
FROM album_metrics
ORDER BY
    TotalRevenue DESC, AlbumTitle;

 
-- 2) Top 10 most profitable albums (by TotalRevenue)
 
WITH album_metrics AS (
    SELECT
        al.AlbumId,
        al.Title AS AlbumTitle,
        ar.Name  AS ArtistName,
        COUNT(DISTINCT t.TrackId) AS TotalTracks,
        COALESCE(SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))), 0) AS TotalRevenue
    FROM Album al
    JOIN Artist ar ON ar.ArtistId = al.ArtistId
    JOIN Track t   ON t.AlbumId = al.AlbumId
    LEFT JOIN InvoiceLine il ON il.TrackId = t.TrackId
    GROUP BY al.AlbumId, al.Title, ar.Name
)
SELECT TOP 10
    AlbumId,
    AlbumTitle,
    ArtistName,
    TotalTracks,
    TotalRevenue,
    CAST(1.0 * TotalRevenue / NULLIF(TotalTracks, 0) AS DECIMAL(18,4)) AS AvgRevenuePerTrack
FROM album_metrics
ORDER BY TotalRevenue DESC, AlbumTitle;

 
-- 3) Bottom 10 least profitable albums (by TotalRevenue)
 
WITH album_metrics AS (
    SELECT
        al.AlbumId,
        al.Title AS AlbumTitle,
        ar.Name  AS ArtistName,
        COUNT(DISTINCT t.TrackId) AS TotalTracks,
        COALESCE(SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,2))), 0) AS TotalRevenue
    FROM Album al
    JOIN Artist ar ON ar.ArtistId = al.ArtistId
    JOIN Track t   ON t.AlbumId = al.AlbumId
    LEFT JOIN InvoiceLine il ON il.TrackId = t.TrackId
    GROUP BY al.AlbumId, al.Title, ar.Name
)
SELECT TOP 10
    AlbumId,
    AlbumTitle,
    ArtistName,
    TotalTracks,
    TotalRevenue,
    CAST(1.0 * TotalRevenue / NULLIF(TotalTracks, 0) AS DECIMAL(18,4)) AS AvgRevenuePerTrack
FROM album_metrics
ORDER BY TotalRevenue ASC, AlbumTitle;

 
-- 4) Correlations
--    - Track count vs revenue
--    - Duration vs revenue
 
WITH album_metrics AS (
    SELECT
        al.AlbumId,
        COUNT(DISTINCT t.TrackId) AS TotalTracks,
        COALESCE(SUM(CAST(il.UnitPrice * il.Quantity AS DECIMAL(18,6))), 0) AS TotalRevenue,
        CAST(SUM(CAST(t.Milliseconds AS BIGINT)) AS DECIMAL(18,6)) AS TotalDurationMs
    FROM Album al
    JOIN Track t
        ON t.AlbumId = al.AlbumId
    LEFT JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
    GROUP BY al.AlbumId
),
agg AS (
    SELECT
        COUNT(*) AS n,

        SUM(CAST(TotalTracks AS DECIMAL(18,6))) AS sum_x_tracks,
        SUM(CAST(TotalRevenue AS DECIMAL(18,6))) AS sum_y_rev,
        SUM(CAST(TotalDurationMs AS DECIMAL(18,6))) AS sum_x_dur,

        SUM(CAST(TotalTracks AS DECIMAL(18,6)) * CAST(TotalRevenue AS DECIMAL(18,6))) AS sum_xy_tracks_rev,
        SUM(CAST(TotalDurationMs AS DECIMAL(18,6)) * CAST(TotalRevenue AS DECIMAL(18,6))) AS sum_xy_dur_rev,

        SUM(CAST(TotalTracks AS DECIMAL(18,6)) * CAST(TotalTracks AS DECIMAL(18,6))) AS sum_x2_tracks,
        SUM(CAST(TotalDurationMs AS DECIMAL(18,6)) * CAST(TotalDurationMs AS DECIMAL(18,6))) AS sum_x2_dur,
        SUM(CAST(TotalRevenue AS DECIMAL(18,6)) * CAST(TotalRevenue AS DECIMAL(18,6))) AS sum_y2_rev
    FROM album_metrics
)
SELECT
    CAST(
        (n * sum_xy_tracks_rev - sum_x_tracks * sum_y_rev)
        / NULLIF(SQRT((n * sum_x2_tracks - sum_x_tracks * sum_x_tracks)
                      * (n * sum_y2_rev   - sum_y_rev   * sum_y_rev)), 0)
        AS DECIMAL(18,6)
    ) AS Corr_TrackCount_vs_Revenue,

    CAST(
        (n * sum_xy_dur_rev - sum_x_dur * sum_y_rev)
        / NULLIF(SQRT((n * sum_x2_dur - sum_x_dur * sum_x_dur)
                      * (n * sum_y2_rev - sum_y_rev * sum_y_rev)), 0)
        AS DECIMAL(18,6)
    ) AS Corr_Duration_vs_Revenue
FROM agg;

 

