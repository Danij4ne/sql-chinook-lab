
SELECT TrackId , Name
FROM track
WHERE TrackId NOT IN (
    SELECT TrackId
    FROM InvoiceLine
)
ORDER BY Name ;