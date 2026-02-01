
-- 1) COUNTRY-LEVEL KPIs

WITH country_kpis AS (
    SELECT
        billing_country AS country,
        SUM(total)      AS total_revenue,
        COUNT(*)        AS invoice_count,
        AVG(total)      AS avg_invoice_value
    FROM invoice
    GROUP BY billing_country
)
SELECT
    country,
    total_revenue,
    invoice_count,
    avg_invoice_value
FROM country_kpis
ORDER BY total_revenue DESC, country ASC;


-- 2) COUNTRIES RANKED BY TOTAL REVENUE

WITH country_sales AS (
    SELECT
        billing_country AS country,
        SUM(total)      AS total_revenue
    FROM invoice
    GROUP BY billing_country
),
ranked_countries AS (
    SELECT
        country,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM country_sales
)
SELECT
    revenue_rank,
    country,
    total_revenue
FROM ranked_countries
ORDER BY revenue_rank ASC, country ASC;


-- 3) COUNTRIES ABOVE GLOBAL AVERAGE REVENUE

WITH country_sales AS (
    SELECT
        billing_country AS country,
        SUM(total)      AS total_revenue
    FROM invoice
    GROUP BY billing_country
),
global_avg AS (
    SELECT AVG(total_revenue) AS avg_country_revenue
    FROM country_sales
)
SELECT
    cs.country,
    cs.total_revenue
FROM country_sales cs
CROSS JOIN global_avg ga
WHERE cs.total_revenue > ga.avg_country_revenue
ORDER BY cs.total_revenue DESC, cs.country ASC;


-- 4) YEAR-OVER-YEAR REVENUE BY COUNTRY

SELECT
    EXTRACT(YEAR FROM invoice_date)::int AS year,
    billing_country                     AS country,
    SUM(total)                          AS yearly_revenue
FROM invoice
GROUP BY
    EXTRACT(YEAR FROM invoice_date),
    billing_country
ORDER BY
    country ASC,
    year ASC;
