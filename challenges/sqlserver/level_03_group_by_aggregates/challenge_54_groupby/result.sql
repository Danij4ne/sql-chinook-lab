
SELECT
    Album.Title AS AlbumTitle,
    AVG(Track.UnitPrice) AS AvgTrackPrice
FROM Album
JOIN Track
    ON Album.AlbumId = Track.AlbumId
GROUP BY Album.Title
ORDER BY AvgTrackPrice DESC;