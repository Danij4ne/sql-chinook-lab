
SELECT 
    Artist.Name AS ArtistName,
    COUNT(Track.TrackId) AS TrackCount
FROM Artist
JOIN Album 
    ON Artist.ArtistId = Album.ArtistId
JOIN Track 
    ON Album.AlbumId = Track.AlbumId
GROUP BY 
    Artist.Name
ORDER BY 
    TrackCount DESC;