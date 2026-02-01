
-- 1) CUSTOMER REPEAT KPIs

WITH customer_kpis AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(i.invoice_id)        AS invoice_count,
        SUM(i.total)               AS total_revenue,
        MIN(i.invoice_date)        AS first_invoice_date,
        MAX(i.invoice_date)        AS last_invoice_date
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    invoice_count,
    total_revenue,
    first_invoice_date,
    last_invoice_date
FROM customer_kpis
ORDER BY invoice_count DESC, customer_id ASC;


-- 2) REPEAT CUSTOMERS (invoice_count >= 3)

WITH customer_kpis AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(i.invoice_id) AS invoice_count,
        SUM(i.total)        AS total_revenue
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    invoice_count,
    total_revenue
FROM customer_kpis
WHERE invoice_count >= 3
ORDER BY invoice_count DESC, customer_id ASC;


-- 3) CUSTOMER DISTRIBUTION BY INVOICE COUNT

WITH customer_invoice_counts AS (
    SELECT
        customer_id,
        COUNT(invoice_id) AS invoice_count
    FROM invoice
    GROUP BY customer_id
)
SELECT
    invoice_count,
    COUNT(*) AS customer_count
FROM customer_invoice_counts
GROUP BY invoice_count
ORDER BY invoice_count ASC;


-- 4) REVENUE CONTRIBUTION: REPEAT VS NON-REPEAT CUSTOMERS

WITH customer_kpis AS (
    SELECT
        c.customer_id,
        COUNT(i.invoice_id) AS invoice_count,
        SUM(i.total)        AS total_revenue
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY c.customer_id
),
classified_customers AS (
    SELECT
        CASE
            WHEN invoice_count >= 3 THEN 'repeat'
            ELSE 'non_repeat'
        END AS customer_type,
        total_revenue
    FROM customer_kpis
),
revenue_by_type AS (
    SELECT
        customer_type,
        SUM(total_revenue) AS total_revenue
    FROM classified_customers
    GROUP BY customer_type
),
global_total AS (
    SELECT SUM(total_revenue) AS all_revenue
    FROM revenue_by_type
)
SELECT
    rbt.customer_type,
    rbt.total_revenue,
    ROUND((rbt.total_revenue::numeric / gt.all_revenue::numeric) * 100.0, 2) AS revenue_share_pct
FROM revenue_by_type rbt
CROSS JOIN global_total gt
ORDER BY revenue_share_pct DESC;
