
SELECT
    track_id,
    name,
    media_type_id
FROM track
WHERE media_type_id = 1
ORDER BY track_id ASC;
