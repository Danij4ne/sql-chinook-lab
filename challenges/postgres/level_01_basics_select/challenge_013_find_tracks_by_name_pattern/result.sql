
SELECT
    track_id,
    name,
    unit_price
FROM track
WHERE name ILIKE '%love%'
ORDER BY name ASC;
