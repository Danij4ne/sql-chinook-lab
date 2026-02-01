 
-- 1) GLOBAL KPIs (1 row)

SELECT
    SUM(i.total)                      AS total_global_sales,
    COUNT(*)                          AS total_invoices,
    AVG(i.total)                      AS average_invoice_value,
    MAX(i.total)                      AS highest_invoice_total,
    MIN(i.total)                      AS lowest_invoice_total
FROM invoice i;


-- 2) TOP 10 HIGHEST-SPENDING CUSTOMERS

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
ORDER BY
    total_spent DESC
LIMIT 10;


-- 3) SALES AGGREGATED BY Country + Year + Month

SELECT
    i.billing_country                              AS country,
    EXTRACT(YEAR FROM i.invoice_date)::int         AS year,
    EXTRACT(MONTH FROM i.invoice_date)::int        AS month,
    SUM(i.total)                                   AS sales
FROM invoice i
GROUP BY
    i.billing_country,
    EXTRACT(YEAR FROM i.invoice_date),
    EXTRACT(MONTH FROM i.invoice_date)
ORDER BY
    country,
    year,
    month;


-- 4) COUNTRIES RANKED BY TOTAL SALES

WITH country_sales AS (
    SELECT
        i.billing_country AS country,
        SUM(i.total)      AS total_sales
    FROM invoice i
    GROUP BY
        i.billing_country
),
ranked_countries AS (
    SELECT
        country,
        total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS country_rank
    FROM country_sales
)
SELECT
    country_rank,
    country,
    total_sales
FROM ranked_countries
ORDER BY
    country_rank, country;


-- 5) CUSTOMERS RANKED BY TOTAL SPENDING

WITH customer_sales AS (
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
    FROM customer_sales
)
SELECT
    customer_rank,
    customer_id,
    first_name,
    last_name,
    total_spent
FROM ranked_customers
ORDER BY
    customer_rank, last_name, first_name;


-- 6) MONTHLY REVENUE TREND (Year-Month)

WITH monthly_revenue AS (
    SELECT
        EXTRACT(YEAR FROM i.invoice_date)::int   AS year,
        EXTRACT(MONTH FROM i.invoice_date)::int  AS month,
        SUM(i.total)                             AS monthly_sales
    FROM invoice i
    GROUP BY
        EXTRACT(YEAR FROM i.invoice_date),
        EXTRACT(MONTH FROM i.invoice_date)
)
SELECT
    year,
    month,
    monthly_sales
FROM monthly_revenue
ORDER BY
    year,
    month;
