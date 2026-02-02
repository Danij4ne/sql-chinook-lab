
WITH country_genre_revenue AS (
    SELECT
        i.billing_country,
        g.name AS genre_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN genre g
        ON t.genre_id = g.genre_id
    GROUP BY
        i.billing_country,
        g.name
),
ranked_genres AS (
    SELECT
        billing_country,
        genre_name,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY billing_country
            ORDER BY total_revenue DESC, genre_name ASC
        ) AS country_rank
    FROM country_genre_revenue
)
SELECT
    billing_country,
    genre_name,
    total_revenue,
    country_rank
FROM ranked_genres
WHERE country_rank <= 3
ORDER BY billing_country ASC, country_rank ASC, genre_name ASC;
