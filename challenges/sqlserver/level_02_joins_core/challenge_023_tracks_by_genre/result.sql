
SELECT t.trackid,
       t.name AS TrackName,
       g.name AS GenreName
FROM track t
JOIN genre g
ON t.genreid = g.genreid
ORDER BY GenreName, TrackName;
