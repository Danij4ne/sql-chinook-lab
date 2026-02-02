
/*
CHALLENGE 036 — Total Revenue by Billing Country

Goal:
Calculate total invoice revenue per billing country.

Instructions:
1) Query the table: invoice
2) Group rows by:
   - billing_country
3) Compute:
   - SUM(total) AS total_revenue
4) Select exactly these columns (in this order):
   - billing_country
   - total_revenue
5) Filter groups where:
   - SUM(total) >= 50.00
6) Sort the result by:
   - total_revenue DESC
   - billing_country ASC

Expected:
A result set with 2 columns:
billing_country, total_revenue
Only countries with total_revenue >= 50.00, ordered by total_revenue descending and billing_country ascending.
*/
