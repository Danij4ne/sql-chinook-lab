
-- 1) TRACK-LEVEL KPIs

WITH track_kpis AS (
    SELECT
        t.track_id,
        t.name AS track_name,
        SUM(il.quantity)                             AS total_quantity_sold,
        SUM(il.unit_price * il.quantity)             AS total_revenue,
        COUNT(DISTINCT i.invoice_id)                 AS invoice_count,
        COUNT(DISTINCT i.customer_id)                AS customer_count
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    GROUP BY
        t.track_id,
        t.name
)
SELECT
    track_id,
    track_name,
    total_quantity_sold,
    total_revenue,
    invoice_count,
    customer_count
FROM track_kpis
ORDER BY total_quantity_sold DESC, track_id ASC;


-- 2) TRACKS RANKED BY TOTAL QUANTITY SOLD

WITH track_qty AS (
    SELECT
        t.track_id,
        t.name AS track_name,
        SUM(il.quantity) AS total_quantity_sold
    FROM invoice_line il
    JOIN track t
        ON il.track_id = t.track_id
    GROUP BY
        t.track_id, t.name
),
ranked_tracks AS (
    SELECT
        track_id,
        track_name,
        total_quantity_sold,
        RANK() OVER (ORDER BY total_quantity_sold DESC) AS quantity_rank
    FROM track_qty
)
SELECT
    quantity_rank,
    track_id,
    track_name,
    total_quantity_sold
FROM ranked_tracks
ORDER BY quantity_rank ASC, track_id ASC;


-- 3) TOP 20 TRACKS BY TOTAL QUANTITY SOLD

WITH track_qty AS (
    SELECT
        t.track_id,
        t.name AS track_name,
        SUM(il.quantity) AS total_quantity_sold
    FROM invoice_line il
    JOIN track t
        ON il.track_id = t.track_id
    GROUP BY
        t.track_id, t.name
),
ranked_tracks AS (
    SELECT
        track_id,
        track_name,
        total_quantity_sold,
        RANK() OVER (ORDER BY total_quantity_sold DESC) AS quantity_rank
    FROM track_qty
)
SELECT
    quantity_rank,
    track_id,
    track_name,
    total_quantity_sold
FROM ranked_tracks
ORDER BY quantity_rank ASC, track_id ASC
LIMIT 20;


-- 4) TRACKS RANKED BY TOTAL REVENUE

WITH track_rev AS (
    SELECT
        t.track_id,
        t.name AS track_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM invoice_line il
    JOIN track t
        ON il.track_id = t.track_id
    GROUP BY
        t.track_id, t.name
),
ranked_tracks AS (
    SELECT
        track_id,
        track_name,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM track_rev
)
SELECT
    revenue_rank,
    track_id,
    track_name,
    total_revenue
FROM ranked_tracks
ORDER BY revenue_rank ASC, track_id ASC;


-- 5) MONTHLY SALES TREND FOR THE TOP 1 TRACK (BY TOTAL QUANTITY SOLD)

WITH track_qty AS (
    SELECT
        t.track_id,
        SUM(il.quantity) AS total_quantity_sold
    FROM invoice_line il
    JOIN track t
        ON il.track_id = t.track_id
    GROUP BY t.track_id
),
top_track AS (
    SELECT track_id
    FROM track_qty
    ORDER BY total_quantity_sold DESC, track_id ASC
    LIMIT 1
),
monthly_trend AS (
    SELECT
        DATE_TRUNC('month', i.invoice_date)::date AS month_start,
        SUM(il.quantity)                          AS monthly_quantity_sold,
        SUM(il.unit_price * il.quantity)          AS monthly_revenue
    FROM invoice i
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN top_track tt
        ON il.track_id = tt.track_id
    GROUP BY DATE_TRUNC('month', i.invoice_date)::date
)
SELECT
    month_start,
    monthly_quantity_sold,
    monthly_revenue
FROM monthly_trend
ORDER BY month_start ASC;
