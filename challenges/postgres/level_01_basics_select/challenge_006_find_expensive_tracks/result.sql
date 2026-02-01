
SELECT
    track_id,
    name,
    unit_price
FROM track
WHERE unit_price > 1.00
ORDER BY unit_price DESC, name ASC;
