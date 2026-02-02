
SELECT
    t.TrackId,
    t.Name,
    t.AlbumId,
    t.Milliseconds
FROM Track t
WHERE t.Milliseconds > (
    SELECT AVG(tr.Milliseconds)
    FROM Track tr
    WHERE tr.AlbumId = t.AlbumId
)
ORDER BY
    t.AlbumId,
    t.Milliseconds DESC;