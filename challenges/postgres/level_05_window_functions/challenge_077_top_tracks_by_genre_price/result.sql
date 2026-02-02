
WITH ranked_tracks AS (
    SELECT
        g.name AS genre_name,
        t.track_id,
        t.name AS track_name,
        t.unit_price,
        ROW_NUMBER() OVER (
            PARTITION BY t.genre_id
            ORDER BY t.unit_price DESC, t.track_id ASC
        ) AS price_rank
    FROM track t
    JOIN genre g
        ON t.genre_id = g.genre_id
)
SELECT
    genre_name,
    track_id,
    track_name,
    unit_price,
    price_rank
FROM ranked_tracks
WHERE price_rank <= 5
ORDER BY genre_name ASC, price_rank ASC, track_id ASC;
