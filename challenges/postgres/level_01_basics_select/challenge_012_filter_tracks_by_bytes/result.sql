
SELECT
    track_id,
    name,
    bytes
FROM track
WHERE bytes > 100000000
ORDER BY bytes DESC;
