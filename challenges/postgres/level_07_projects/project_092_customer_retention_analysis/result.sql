
-- 1) CUSTOMER PURCHASE FREQUENCY (per customer)

WITH customer_activity AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(i.invoice_id)            AS invoice_count,
        MIN(i.invoice_date)            AS first_invoice_date,
        MAX(i.invoice_date)            AS last_invoice_date
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
    first_invoice_date,
    last_invoice_date
FROM customer_activity
ORDER BY invoice_count DESC, customer_id ASC;


-- 2) RETURNING CUSTOMERS (invoice_count >= 2)

WITH customer_activity AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(i.invoice_id) AS invoice_count
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
    invoice_count
FROM customer_activity
WHERE invoice_count >= 2
ORDER BY invoice_count DESC, customer_id ASC;


-- 3) RETENTION SUMMARY KPIs (1 row)

WITH customer_activity AS (
    SELECT
        c.customer_id,
        COUNT(i.invoice_id) AS invoice_count
    FROM customer c
    LEFT JOIN invoice i
        ON i.customer_id = c.customer_id
    GROUP BY c.customer_id
),
kpis AS (
    SELECT
        COUNT(*) FILTER (WHERE customer_id IS NOT NULL)           AS total_customers,
        COUNT(*) FILTER (WHERE invoice_count >= 2)                AS returning_customers
    FROM customer_activity
)
SELECT
    total_customers,
    returning_customers,
    ROUND((returning_customers::numeric / total_customers::numeric) * 100.0, 2) AS returning_rate_pct
FROM kpis;


-- 4) MONTHLY RETENTION TREND (cohort: first purchase month)

WITH first_purchase AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(invoice_date))::date AS cohort_month
    FROM invoice
    GROUP BY customer_id
),
cohort_customers AS (
    SELECT
        cohort_month,
        customer_id
    FROM first_purchase
),
retained_flags AS (
    SELECT
        cc.cohort_month,
        cc.customer_id,
        CASE
            WHEN EXISTS (
                SELECT 1
                FROM invoice i2
                WHERE i2.customer_id = cc.customer_id
                  AND DATE_TRUNC('month', i2.invoice_date)::date > cc.cohort_month
            )
            THEN 1
            ELSE 0
        END AS is_retained
    FROM cohort_customers cc
),
cohort_summary AS (
    SELECT
        cohort_month,
        COUNT(*)                                    AS new_customers,
        SUM(is_retained)                             AS retained_customers
    FROM retained_flags
    GROUP BY cohort_month
)
SELECT
    cohort_month,
    new_customers,
    retained_customers,
    ROUND((retained_customers::numeric / new_customers::numeric) * 100.0, 2) AS retention_rate_pct
FROM cohort_summary
ORDER BY cohort_month ASC;
