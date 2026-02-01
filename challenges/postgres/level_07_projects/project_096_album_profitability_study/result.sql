
-- 1) ALBUM-LEVEL PROFITABILITY KPIs

WITH album_tracks AS (
    SELECT
        a.album_id,
        a.title AS album_title,
        ar.name AS artist_name,
        COUNT(t.track_id) AS track_count
    FROM album a
    JOIN artist ar
        ON a.artist_id = ar.artist_id
    JOIN track t
        ON t.album_id = a.album_id
    GROUP BY
        a.album_id, a.title, ar.name
),
album_sales AS (
    SELECT
        a.album_id,
        SUM(il.unit_price * il.quantity)      AS total_revenue,
        SUM(il.quantity)                      AS total_quantity_sold,
        COUNT(DISTINCT i.invoice_id)          AS invoice_count,
        COUNT(DISTINCT i.customer_id)         AS customer_count
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album a
        ON t.album_id = a.album_id
    GROUP BY
        a.album_id
)
SELECT
    at.album_id,
    at.album_title,
    at.artist_name,
    als.total_revenue,
    als.total_quantity_sold,
    als.invoice_count,
    als.customer_count,
    at.track_count
FROM album_tracks at
JOIN album_sales als
    ON at.album_id = als.album_id
ORDER BY als.total_revenue DESC, at.album_id ASC;


-- 2) ALBUMS RANKED BY TOTAL REVENUE

WITH album_revenue AS (
    SELECT
        a.album_id,
        a.title AS album_title,
        ar.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album a
        ON t.album_id = a.album_id
    JOIN artist ar
        ON a.artist_id = ar.artist_id
    GROUP BY
        a.album_id, a.title, ar.name
),
ranked_albums AS (
    SELECT
        album_id,
        album_title,
        artist_name,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM album_revenue
)
SELECT
    revenue_rank,
    album_id,
    album_title,
    artist_name,
    total_revenue
FROM ranked_albums
ORDER BY revenue_rank ASC, album_id ASC;


-- 3) TOP 10 ALBUMS BY TOTAL REVENUE

WITH album_revenue AS (
    SELECT
        a.album_id,
        a.title AS album_title,
        ar.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album a
        ON t.album_id = a.album_id
    JOIN artist ar
        ON a.artist_id = ar.artist_id
    GROUP BY
        a.album_id, a.title, ar.name
),
ranked_albums AS (
    SELECT
        album_id,
        album_title,
        artist_name,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM album_revenue
)
SELECT
    revenue_rank,
    album_id,
    album_title,
    artist_name,
    total_revenue
FROM ranked_albums
ORDER BY revenue_rank ASC, album_id ASC
LIMIT 10;


-- 4) HIGH PRICE ALBUMS (avg track price >= 1.00)

WITH album_avg_price AS (
    SELECT
        a.album_id,
        a.title AS album_title,
        AVG(t.unit_price) AS avg_track_price
    FROM album a
    JOIN track t
        ON t.album_id = a.album_id
    GROUP BY
        a.album_id, a.title
)
SELECT
    album_id,
    album_title,
    avg_track_price
FROM album_avg_price
WHERE avg_track_price >= 1.00
ORDER BY avg_track_price DESC, album_title ASC;


-- 5) MONTHLY REVENUE TREND FOR THE TOP 1 ALBUM (BY TOTAL REVENUE)

WITH album_revenue AS (
    SELECT
        a.album_id,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN album a
        ON t.album_id = a.album_id
    GROUP BY a.album_id
),
top_album AS (
    SELECT album_id
    FROM album_revenue
    ORDER BY total_revenue DESC, album_id ASC
    LIMIT 1
),
monthly_trend AS (
    SELECT
        DATE_TRUNC('month', i.invoice_date)::date AS month_start,
        SUM(il.unit_price * il.quantity)          AS monthly_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN top_album ta
        ON t.album_id = ta.album_id
    GROUP BY DATE_TRUNC('month', i.invoice_date)::date
)
SELECT
    month_start,
    monthly_revenue
FROM monthly_trend
ORDER BY month_start ASC;
