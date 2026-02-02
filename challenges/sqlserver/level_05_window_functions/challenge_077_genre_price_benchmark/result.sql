
SELECT 
    Track.TrackId,
    Track.Name,
    Genre.Name AS GenreName,
    Track.UnitPrice,
    AVG(Track.UnitPrice) OVER (PARTITION BY Genre.Name) AS AvgGenrePrice
FROM Track
JOIN Genre 
    ON Track.GenreId = Genre.GenreId
ORDER BY GenreName, Track.TrackId;