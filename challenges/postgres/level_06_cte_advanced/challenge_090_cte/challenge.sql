
/*
CHALLENGE 090 — Customer Revenue Share by Country

Goal:
Return each customer’s total spending and their percentage share of total revenue within their country.

Instructions:
1) Create a CTE named customer_totals that:
   - queries customer and invoice
   - joins customer.customer_id = invoice.customer_id
   - groups by customer.country, customer.customer_id, customer.first_name, customer.last_name
   - computes SUM(invoice.total) AS total_spent
2) Create a CTE named country_totals that:
   - queries customer_totals
   - groups by country
   - computes SUM(total_spent) AS country_total_spent
3) Join customer_totals to country_totals using:
   - customer_totals.country = country_totals.country
4) Compute a new column:
   - (total_spent / country_total_spent) * 100 AS country_revenue_share_pct
5) Select exactly these columns (in this order):
   - country
   - customer_id
   - first_name
   - last_name
   - total_spent
   - country_total_spent
   - country_revenue_share_pct
6) Filter rows where:
   - country = 'USA'
7) Sort the result by:
   - country_revenue_share_pct DESC
   - customer_id ASC

Expected:
A result set with 7 columns:
country, customer_id, first_name, last_name, total_spent, country_total_spent, country_revenue_share_pct
Only customers from 'USA', ordered by country_revenue_share_pct descending and customer_id ascending.
*/
