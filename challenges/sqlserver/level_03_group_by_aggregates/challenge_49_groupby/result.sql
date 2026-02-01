
SELECT
    m.Name AS MediaTypeName,
    COUNT(t.TrackId) AS TrackCount
FROM Track t
JOIN MediaType m
    ON t.MediaTypeId = m.MediaTypeId
GROUP BY m.Name
ORDER BY TrackCount DESC;