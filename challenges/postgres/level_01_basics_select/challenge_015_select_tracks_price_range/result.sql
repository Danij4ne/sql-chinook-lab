
SELECT
    track_id,
    name,
    unit_price
FROM track
WHERE unit_price BETWEEN 0.99 AND 1.99
ORDER BY unit_price ASC, name ASC;
