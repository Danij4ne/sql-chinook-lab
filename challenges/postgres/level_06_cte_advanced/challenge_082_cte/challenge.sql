
/*
CHALLENGE 082 — Top 10 Customers by Lifetime Spending

Goal:
Return the top 10 customers by total lifetime spending using a CTE.

Instructions:
1) Create a CTE named customer_totals that:
   - queries invoice
   - groups by customer_id
   - computes SUM(total) AS total_spent
2) Query the tables:
   - customer
   - customer_totals (CTE)
3) Join customer to customer_totals using:
   - customer.customer_id = customer_totals.customer_id
4) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - customer.country
   - customer_totals.total_spent
5) Sort the result by:
   - customer_totals.total_spent DESC
   - customer.customer_id ASC
6) Limit the result to:
   - 10 rows

Expected:
A result set with 5 columns:
customer_id, first_name, last_name, country, total_spent
Only the top 10 customers by total_spent, ordered by total_spent descending and customer_id ascending.
*/
