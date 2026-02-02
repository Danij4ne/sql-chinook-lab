
/*
CHALLENGE 086 — Customers with Revenue Above Country Average

Goal:
Return customers whose total spending is above the average spending of their country.

Instructions:
1) Create a CTE named customer_totals that:
   - queries customer and invoice
   - joins customer.customer_id = invoice.customer_id
   - groups by customer.country, customer.customer_id, customer.first_name, customer.last_name
   - computes SUM(invoice.total) AS total_spent
2) Create a CTE named country_averages that:
   - queries customer_totals
   - groups by country
   - computes AVG(total_spent) AS avg_country_spent
3) Join customer_totals to country_averages using:
   - customer_totals.country = country_averages.country
4) Filter rows where:
   - customer_totals.total_spent > country_averages.avg_country_spent
5) Select exactly these columns (in this order):
   - country
   - customer_id
   - first_name
   - last_name
   - total_spent
   - avg_country_spent
6) Sort the result by:
   - country ASC
   - total_spent DESC
   - customer_id ASC

Expected:
A result set with 6 columns:
country, customer_id, first_name, last_name, total_spent, avg_country_spent
Only customers who spent more than their country average, ordered by country ascending, then total_spent descending, then customer_id ascending.
*/
