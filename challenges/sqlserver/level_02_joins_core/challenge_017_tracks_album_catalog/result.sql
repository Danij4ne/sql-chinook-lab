
SELECT t.trackid , t.name AS TrackName , a.title AS AlbumTitle
FROM track t
INNER JOIN album a
ON t.albumid = a.albumid
ORDER BY TrackName ASC ;