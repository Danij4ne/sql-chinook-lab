
-- 1) GLOBAL STORE KPIs

SELECT
    SUM(total)                      AS total_revenue,
    COUNT(*)                        AS total_invoices,
    COUNT(DISTINCT customer_id)     AS total_customers,
    AVG(total)                      AS avg_invoice_value
FROM invoice;


-- 2) TOP 10 CUSTOMERS BY TOTAL SPENDING

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    total_spent
FROM customer_spending
ORDER BY total_spent DESC
LIMIT 10;


-- 3) TOP 10 ARTISTS BY TOTAL REVENUE

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
        ar.artist_id, ar.name
)
SELECT
    artist_id,
    artist_name,
    total_revenue
FROM artist_revenue
ORDER BY total_revenue DESC
LIMIT 10;


-- 4) SALES DISTRIBUTION BY COUNTRY

WITH country_sales AS (
    SELECT
        billing_country AS country,
        SUM(total)      AS total_revenue
    FROM invoice
    GROUP BY billing_country
),
global_total AS (
    SELECT SUM(total_revenue) AS all_revenue
    FROM country_sales
)
SELECT
    cs.country,
    cs.total_revenue,
    ROUND((cs.total_revenue::numeric / gt.all_revenue::numeric) * 100.0, 2) AS revenue_share_pct
FROM country_sales cs
CROSS JOIN global_total gt
ORDER BY revenue_share_pct DESC;


-- 5) MONTHLY REVENUE TREND

SELECT
    EXTRACT(YEAR FROM invoice_date)::int   AS year,
    EXTRACT(MONTH FROM invoice_date)::int  AS month,
    SUM(total)                             AS monthly_revenue
FROM invoice
GROUP BY
    EXTRACT(YEAR FROM invoice_date),
    EXTRACT(MONTH FROM invoice_date)
ORDER BY
    year ASC, month ASC;
