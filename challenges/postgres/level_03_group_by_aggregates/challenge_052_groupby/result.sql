
SELECT
    mt.name AS media_type_name,
    COUNT(t.track_id) AS track_count
FROM track t
JOIN media_type mt
    ON t.media_type_id = mt.media_type_id
GROUP BY
    mt.media_type_id,
    mt.name
HAVING COUNT(t.track_id) >= 100
ORDER BY track_count DESC, mt.name ASC;
