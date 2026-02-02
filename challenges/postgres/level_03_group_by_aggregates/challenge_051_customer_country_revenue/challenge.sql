
/*
CHALLENGE 051 — Total Revenue per Customer Country

Goal:
Calculate the total revenue generated per customer country.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Join customer to invoice using:
   - customer.customer_id = invoice.customer_id
3) Group rows by:
   - customer.country
4) Compute:
   - SUM(invoice.total) AS total_revenue
5) Select exactly these columns (in this order):
   - customer.country AS country
   - total_revenue
6) Filter groups where:
   - SUM(invoice.total) >= 100.00
7) Sort the result by:
   - total_revenue DESC
   - country ASC

Expected:
A result set with 2 columns:
country, total_revenue
Only countries with total_revenue >= 100.00, ordered by total_revenue descending and country ascending.
*/
