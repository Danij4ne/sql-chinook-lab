
/*
CHALLENGE 048 — Total Revenue by Customer Country

Goal:
Calculate total revenue grouped by the customer's country.

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
   - customer.country IN ('USA', 'Canada', 'Brazil')
7) Sort the result by:
   - total_revenue DESC
   - country ASC

Expected:
A result set with 2 columns:
country, total_revenue
Only the countries USA, Canada, and Brazil, ordered by total_revenue descending and country ascending.
*/
