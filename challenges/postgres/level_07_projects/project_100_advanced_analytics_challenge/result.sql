
-- 1) CUSTOMER LIFETIME VALUE (CLV) TABLE

WITH customer_clv AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.country,
        SUM(i.total)        AS total_spent,
        COUNT(i.invoice_id) AS invoice_count,
        MIN(i.invoice_date) AS first_invoice_date,
        MAX(i.invoice_date) AS last_invoice_date
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name, c.country
)
SELECT
    customer_id,
    first_name,
    last_name,
    country,
    total_spent,
    invoice_count,
    first_invoice_date,
    last_invoice_date
FROM customer_clv
ORDER BY total_spent DESC, customer_id ASC;


-- 2) CUSTOMER SEGMENTATION (gold / silver / bronze)

WITH customer_clv AS (
    SELECT
        c.customer_id,
        SUM(i.total) AS total_spent
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY c.customer_id
)
SELECT
    customer_id,
    total_spent,
    CASE
        WHEN total_spent >= 40.00 THEN 'gold'
        WHEN total_spent >= 20.00 AND total_spent < 40.00 THEN 'silver'
        ELSE 'bronze'
    END AS customer_tier
FROM customer_clv
ORDER BY total_spent DESC, customer_id ASC;


-- 3) SEGMENT KPIs (one row per tier)

WITH customer_clv AS (
    SELECT
        c.customer_id,
        SUM(i.total) AS total_spent
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY c.customer_id
),
segmented AS (
    SELECT
        customer_id,
        total_spent,
        CASE
            WHEN total_spent >= 40.00 THEN 'gold'
            WHEN total_spent >= 20.00 AND total_spent < 40.00 THEN 'silver'
            ELSE 'bronze'
        END AS customer_tier
    FROM customer_clv
),
tier_kpis AS (
    SELECT
        customer_tier,
        COUNT(*)                AS customer_count,
        SUM(total_spent)        AS total_revenue,
        AVG(total_spent)        AS avg_revenue_per_customer
    FROM segmented
    GROUP BY customer_tier
)
SELECT
    customer_tier,
    customer_count,
    total_revenue,
    avg_revenue_per_customer
FROM tier_kpis
ORDER BY total_revenue DESC, customer_tier ASC;


-- 4) TOP 10 CUSTOMERS OVERALL (ranked by total_spent)

WITH customer_totals AS (
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
),
ranked_customers AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        total_spent,
        RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
    FROM customer_totals
)
SELECT
    customer_rank,
    customer_id,
    first_name,
    last_name,
    total_spent
FROM ranked_customers
ORDER BY customer_rank ASC, customer_id ASC
LIMIT 10;


-- 5) TOP 5 GENRES BY REVENUE PER CUSTOMER_TIER

WITH customer_spent AS (
    SELECT
        c.customer_id,
        SUM(i.total) AS total_spent
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY c.customer_id
),
customer_tiers AS (
    SELECT
        customer_id,
        CASE
            WHEN total_spent >= 40.00 THEN 'gold'
            WHEN total_spent >= 20.00 AND total_spent < 40.00 THEN 'silver'
            ELSE 'bronze'
        END AS customer_tier
    FROM customer_spent
),
tier_genre_revenue AS (
    SELECT
        ct.customer_tier,
        g.name AS genre_name,
        SUM(il.unit_price * il.quantity) AS total_revenue
    FROM customer_tiers ct
    JOIN invoice i
        ON i.customer_id = ct.customer_id
    JOIN invoice_line il
        ON i.invoice_id = il.invoice_id
    JOIN track t
        ON il.track_id = t.track_id
    JOIN genre g
        ON t.genre_id = g.genre_id
    GROUP BY
        ct.customer_tier,
        g.name
),
ranked_genres AS (
    SELECT
        customer_tier,
        genre_name,
        total_revenue,
        RANK() OVER (
            PARTITION BY customer_tier
            ORDER BY total_revenue DESC, genre_name ASC
        ) AS genre_rank
    FROM tier_genre_revenue
)
SELECT
    customer_tier,
    genre_name,
    total_revenue,
    genre_rank
FROM ranked_genres
WHERE genre_rank <= 5
ORDER BY customer_tier ASC, genre_rank ASC, genre_name ASC;


-- 6) MONTHLY REVENUE TREND BY CUSTOMER_TIER

WITH customer_spent AS (
    SELECT
        c.customer_id,
        SUM(i.total) AS total_spent
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY c.customer_id
),
customer_tiers AS (
    SELECT
        customer_id,
        CASE
            WHEN total_spent >= 40.00 THEN 'gold'
            WHEN total_spent >= 20.00 AND total_spent < 40.00 THEN 'silver'
            ELSE 'bronze'
        END AS customer_tier
    FROM customer_spent
),
tier_monthly_revenue AS (
    SELECT
        ct.customer_tier,
        DATE_TRUNC('month', i.invoice_date)::date AS month_start,
        SUM(i.total) AS monthly_revenue
    FROM customer_tiers ct
    JOIN invoice i
        ON i.customer_id = ct.customer_id
    GROUP BY
        ct.customer_tier,
        DATE_TRUNC('month', i.invoice_date)::date
)
SELECT
    customer_tier,
    month_start,
    monthly_revenue
FROM tier_monthly_revenue
ORDER BY customer_tier ASC, month_start ASC;
