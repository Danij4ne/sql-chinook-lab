
WITH artist_revenue AS (
    SELECT
        ar.artist_id,
        ar.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice_line il
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album al
        ON t.album_id = al.album_id
    JOIN artist ar
        ON al.artist_id = ar.artist_id
    GROUP BY
        ar.artist_id,
        ar.name
)
SELECT
    artist_id,
    artist_name,
    total_revenue
FROM artist_revenue
ORDER BY total_revenue DESC, artist_id ASC
LIMIT 5;
