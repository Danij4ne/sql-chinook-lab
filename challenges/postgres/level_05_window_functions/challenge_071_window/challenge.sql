
/*
CHALLENGE 071 — Rank Customers by Total Spending

Goal:
Rank customers by total spending using a window function.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Join customer to invoice using:
   - customer.customer_id = invoice.customer_id
3) Compute total spending per customer as:
   - SUM(invoice.total) grouped by customer_id
4) In the final result, add a window function column:
   - DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
5) Select exactly these columns (in this order):
   - customer_id
   - first_name
   - last_name
   - total_spent
   - spending_rank
6) Sort the final result by:
   - spending_rank ASC
   - customer_id ASC

Expected:
A result set with 5 columns:
customer_id, first_name, last_name, total_spent, spending_rank
Customers ranked by total_spent (highest first), ordered by spending_rank ascending and customer_id ascending.
*/
