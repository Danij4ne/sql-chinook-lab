
SELECT
    track_id,
    name,
    unit_price
FROM track
WHERE track_id NOT IN (
    SELECT track_id
    FROM invoice_line
)
ORDER BY unit_price DESC, name ASC;
