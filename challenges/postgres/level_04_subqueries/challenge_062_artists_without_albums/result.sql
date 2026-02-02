
SELECT
    artist_id,
    name
FROM artist
WHERE artist_id NOT IN (
    SELECT artist_id
    FROM album
)
ORDER BY name ASC;
