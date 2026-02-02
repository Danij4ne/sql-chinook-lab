
/*
CHALLENGE 057 — Customers with Above Average Spending

Goal:
Return customers whose total spending is above the average customer spending.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Use a subquery to calculate:
   - the average total spending per customer
3) Compute total spending per customer as:
   - SUM(invoice.total)
4) Filter customers where:
   - total spending > (average customer spending)
5) Select exactly these columns (in this order):
   - customer_id
   - first_name
   - last_name
   - total_spent
6) Sort the result by:
   - total_spent DESC
   - customer_id ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, total_spent
Only customers whose total spending is above the average, ordered by total_spent descending and customer_id ascending.
*/
