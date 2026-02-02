
/*
CHALLENGE 078 — Top 3 Customers per Country by Total Spending

Goal:
Return the top 3 customers by total spending within each country using a window function.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Join customer to invoice using:
   - customer.customer_id = invoice.customer_id
3) Compute total spending per customer as:
   - SUM(invoice.total) grouped by customer_id, first_name, last_name, and country
4) Rank customers within each country using:
   - ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_spent DESC, customer_id ASC) AS country_rank
5) Keep only rows where:
   - country_rank <= 3
6) Select exactly these columns (in this order):
   - country
   - customer_id
   - first_name
   - last_name
   - total_spent
   - country_rank
7) Sort the final result by:
   - country ASC
   - country_rank ASC
   - customer_id ASC

Expected:
A result set with 6 columns:
country, customer_id, first_name, last_name, total_spent, country_rank
For each country, only the top 3 customers by total_spent, ordered by country ascending, then country_rank ascending, then customer_id ascending.
*/
