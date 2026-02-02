
SELECT
    a.AlbumId,
    a.Title,
    SUM(t.Milliseconds) AS TotalDurationMs
FROM Album a
JOIN Track t
    ON a.AlbumId = t.AlbumId
GROUP BY
    a.AlbumId,
    a.Title
ORDER BY
    TotalDurationMs DESC;