
SELECT 
    Album.AlbumId,
    Album.Title,
    COUNT(Track.TrackId) AS TrackCount
FROM Album
JOIN Track 
    ON Album.AlbumId = Track.AlbumId
GROUP BY 
    Album.AlbumId,
    Album.Title
ORDER BY 
    TrackCount DESC;