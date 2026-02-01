
SELECT
    T.TrackId,
    T.Name AS TrackName,
    G.Name AS GenreName,
    M.Name AS MediaTypeName
FROM Track AS T
INNER JOIN Genre AS G
    ON T.GenreId = G.GenreId
INNER JOIN MediaType AS M
    ON T.MediaTypeId = M.MediaTypeId
ORDER BY
    TrackName;