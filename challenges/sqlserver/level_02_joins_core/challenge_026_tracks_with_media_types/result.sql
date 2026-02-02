
SELECT
    t.TrackId,
    t.Name AS TrackName,
    mt.Name AS MediaTypeName
FROM Track t
INNER JOIN MediaType mt
    ON t.MediaTypeId = mt.MediaTypeId
ORDER BY
    MediaTypeName,
    TrackName;