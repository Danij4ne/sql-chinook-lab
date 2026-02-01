
/*
CHALLENGE 053 — Total Revenue by Billing City

Goal:
Calculate total invoice revenue per billing city.

Instructions:
1) Query the table: invoice
2) Group rows by:
   - billing_city
3) Compute:
   - SUM(total) AS total_revenue
4) Select exactly these columns (in this order):
   - billing_city
   - total_revenue
5) Filter groups where:
   - billing_country = 'USA'
6) Sort the result by:
   - total_revenue DESC
   - billing_city ASC

Expected:
A result set with 2 columns:
billing_city, total_revenue
Only billing cities in 'USA', ordered by total_revenue descending and billing_city ascending.
*/
