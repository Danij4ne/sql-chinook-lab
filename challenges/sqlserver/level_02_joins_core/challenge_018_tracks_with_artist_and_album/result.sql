
SELECT 
    t.Name AS TrackName,
    al.Title AS AlbumTitle,
    a.Name AS ArtistName
FROM track t
JOIN album al
    ON t.AlbumId = al.AlbumId
JOIN artist a
    ON al.ArtistId = a.ArtistId
ORDER BY a.Name ASC;