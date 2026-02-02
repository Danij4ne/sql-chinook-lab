
SELECT 
    Artist.Name AS ArtistName,
    COUNT(Album.AlbumId) AS AlbumCount
FROM Artist
JOIN Album 
    ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name
ORDER BY AlbumCount DESC;