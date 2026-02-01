
/*
CHALLENGE 084 — Monthly Revenue by Country

Goal:
Calculate monthly invoice revenue per billing country using a CTE.

Instructions:
1) Create a CTE named monthly_country_revenue that:
   - queries invoice
   - creates month_start as: DATE_TRUNC('month', invoice_date)::date
   - groups by billing_country and month_start
   - computes SUM(total) AS monthly_revenue
2) Select exactly these columns (in this order) from the CTE:
   - billing_country
   - month_start
   - monthly_revenue
3) Filter rows where:
   - month_start >= '2012-01-01'
4) Sort the result by:
   - billing_country ASC
   - month_start ASC

Expected:
A result set with 3 columns:
billing_country, month_start, monthly_revenue
Only months on or after 2012-01-01, ordered by billing_country ascending and month_start ascending.
*/
