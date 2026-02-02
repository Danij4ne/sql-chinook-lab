
SELECT
    t.track_id,
    t.name,
    mt.name AS media_type_name,
    t.milliseconds
FROM track t
JOIN media_type mt
    ON t.media_type_id = mt.media_type_id
WHERE mt.name = 'MPEG audio file'
ORDER BY t.milliseconds DESC, t.name ASC;
