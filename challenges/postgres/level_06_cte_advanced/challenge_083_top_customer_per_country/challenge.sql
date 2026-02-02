
/*
CHALLENGE 083 — Top Customer per Country

Goal:
Return the top customer by total spending for each country using CTEs.

Instructions:
1) Create a CTE named customer_totals that:
   - queries customer and invoice
   - joins customer.customer_id = invoice.customer_id
   - groups by customer.country, customer.customer_id, customer.first_name, customer.last_name
   - computes SUM(invoice.total) AS total_spent
2) Create a CTE named ranked_customers that:
   - selects from customer_totals
   - adds ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_spent DESC, customer_id ASC) AS country_rank
3) Select only rows where:
   - country_rank = 1
4) Select exactly these columns (in this order):
   - country
   - customer_id
   - first_name
   - last_name
   - total_spent
5) Sort the final result by:
   - country ASC
   - customer_id ASC

Expected:
A result set with 5 columns:
country, customer_id, first_name, last_name, total_spent
One row per country (the top spender), ordered by country ascending and customer_id ascending.
*/
