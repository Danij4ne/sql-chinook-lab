
/*
CHALLENGE 066 — Customers in Top 5 Countries by Revenue

Goal:
Return customers who belong to the top 5 customer countries by total revenue.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Join customer to invoice using:
   - customer.customer_id = invoice.customer_id
3) Use a subquery to compute total revenue per customer country as:
   - SUM(invoice.total) grouped by customer.country
4) From that subquery, select the top 5 countries by:
   - total_revenue DESC
5) Filter customers where:
   - customer.country is IN (top 5 countries by total revenue)
6) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - customer.country
7) Sort the result by:
   - customer.country ASC
   - customer.last_name ASC
   - customer.first_name ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, country
Only customers from the top 5 revenue countries, ordered by country ascending, then last name and first name ascending.
*/
