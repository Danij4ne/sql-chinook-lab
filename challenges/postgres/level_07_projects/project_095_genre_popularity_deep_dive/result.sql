
-- 1) GENRE-LEVEL SALES KPIs

WITH genre_kpis AS (
    SELECT
        g.genre_id,
        g.name AS genre_name,
        SUM(il.unit_price * il.quantity)             AS total_revenue,
        SUM(il.quantity)                             AS total_quantity_sold,
        COUNT(DISTINCT i.invoice_id)                 AS invoice_count,
        COUNT(DISTINCT i.customer_id)                AS customer_count
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN genre g
        ON t.genre_id = g.genre_id
    GROUP BY
        g.genre_id,
        g.name
)
SELECT
    genre_id,
    genre_name,
    total_revenue,
    total_quantity_sold,
    invoice_count,
    customer_count
FROM genre_kpis
ORDER BY total_revenue DESC, genre_id ASC;


-- 2) GENRES RANKED BY TOTAL REVENUE

WITH genre_kpis AS (
    SELECT
        g.genre_id,
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
        g.genre_id,
        g.name
),
ranked_genres AS (
    SELECT
        genre_id,
        genre_name,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM genre_kpis
)
SELECT
    revenue_rank,
    genre_id,
    genre_name,
    total_revenue
FROM ranked_genres
ORDER BY revenue_rank ASC, genre_id ASC;


-- 3) TOP 10 GENRES BY TOTAL REVENUE

WITH genre_kpis AS (
    SELECT
        g.genre_id,
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
        g.genre_id,
        g.name
),
ranked_genres AS (
    SELECT
        genre_id,
        genre_name,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM genre_kpis
)
SELECT
    revenue_rank,
    genre_id,
    genre_name,
    total_revenue
FROM ranked_genres
ORDER BY revenue_rank ASC, genre_id ASC
LIMIT 10;


-- 4) REVENUE SHARE BY GENRE (% OF TOTAL REVENUE)

WITH genre_sales AS (
    SELECT
        g.genre_id,
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
        g.genre_id,
        g.name
),
global_total AS (
    SELECT SUM(total_revenue) AS all_genres_revenue
    FROM genre_sales
)
SELECT
    gs.genre_id,
    gs.genre_name,
    gs.total_revenue,
    ROUND((gs.total_revenue::numeric / gt.all_genres_revenue::numeric) * 100.0, 2) AS revenue_share_pct
FROM genre_sales gs
CROSS JOIN global_total gt
ORDER BY revenue_share_pct DESC, gs.genre_name ASC;


-- 5) MONTHLY REVENUE TREND FOR THE TOP 1 GENRE (BY TOTAL REVENUE)

WITH genre_revenue AS (
    SELECT
        g.genre_id,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN genre g
        ON t.genre_id = g.genre_id
    GROUP BY g.genre_id
),
top_genre AS (
    SELECT genre_id
    FROM genre_revenue
    ORDER BY total_revenue DESC, genre_id ASC
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
    JOIN top_genre tg
        ON t.genre_id = tg.genre_id
    GROUP BY DATE_TRUNC('month', i.invoice_date)::date
)
SELECT
    month_start,
    monthly_revenue
FROM monthly_trend
ORDER BY month_start ASC;
