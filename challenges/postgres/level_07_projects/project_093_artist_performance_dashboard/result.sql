
-- 1) ARTIST-LEVEL KPIs

WITH artist_kpis AS (
    SELECT
        ar.artist_id,
        ar.name AS artist_name,
        SUM(il.unit_price * il.quantity)             AS total_revenue,
        SUM(il.quantity)                             AS total_quantity_sold,
        COUNT(DISTINCT i.invoice_id)                 AS invoice_count,
        COUNT(DISTINCT t.track_id)                   AS distinct_tracks_sold
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
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
    total_revenue,
    total_quantity_sold,
    invoice_count,
    distinct_tracks_sold
FROM artist_kpis
ORDER BY total_revenue DESC, artist_id ASC;


-- 2) ARTISTS RANKED BY TOTAL REVENUE

WITH artist_kpis AS (
    SELECT
        ar.artist_id,
        ar.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album al
        ON t.album_id = al.album_id
    JOIN artist ar
        ON al.artist_id = ar.artist_id
    GROUP BY
        ar.artist_id,
        ar.name
),
ranked_artists AS (
    SELECT
        artist_id,
        artist_name,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM artist_kpis
)
SELECT
    revenue_rank,
    artist_id,
    artist_name,
    total_revenue
FROM ranked_artists
ORDER BY revenue_rank ASC, artist_id ASC;


-- 3) TOP 10 ARTISTS BY TOTAL REVENUE

WITH artist_kpis AS (
    SELECT
        ar.artist_id,
        ar.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album al
        ON t.album_id = al.album_id
    JOIN artist ar
        ON al.artist_id = ar.artist_id
    GROUP BY
        ar.artist_id,
        ar.name
),
ranked_artists AS (
    SELECT
        artist_id,
        artist_name,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM artist_kpis
)
SELECT
    revenue_rank,
    artist_id,
    artist_name,
    total_revenue
FROM ranked_artists
ORDER BY revenue_rank ASC, artist_id ASC
LIMIT 10;


-- 4) MONTHLY REVENUE TREND FOR THE TOP 1 ARTIST (BY TOTAL REVENUE)

WITH artist_revenue AS (
    SELECT
        ar.artist_id,
        ar.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album al
        ON t.album_id = al.album_id
    JOIN artist ar
        ON al.artist_id = ar.artist_id
    GROUP BY
        ar.artist_id,
        ar.name
),
top_artist AS (
    SELECT artist_id
    FROM artist_revenue
    ORDER BY total_revenue DESC, artist_id ASC
    LIMIT 1
),
monthly_trend AS (
    SELECT
        DATE_TRUNC('month', i.invoice_date)::date        AS month_start,
        SUM(il.unit_price * il.quantity)                 AS monthly_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album al
        ON t.album_id = al.album_id
    JOIN top_artist ta
        ON al.artist_id = ta.artist_id
    GROUP BY DATE_TRUNC('month', i.invoice_date)::date
)
SELECT
    month_start,
    monthly_revenue
FROM monthly_trend
ORDER BY month_start ASC;
