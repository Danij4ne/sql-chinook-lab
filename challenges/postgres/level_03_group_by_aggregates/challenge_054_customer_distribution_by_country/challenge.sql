
/*
CHALLENGE 054 — Customers per Country

Goal:
Calculate how many customers are located in each country.

Instructions:
1) Query the table: customer
2) Group rows by:
   - country
3) Compute:
   - COUNT(customer_id) AS customer_count
4) Select exactly these columns (in this order):
   - country
   - customer_count
5) Filter groups where:
   - COUNT(customer_id) >= 3
6) Sort the result by:
   - customer_count DESC
   - country ASC

Expected:
A result set with 2 columns:
country, customer_count
Only countries with at least 3 customers, ordered by customer_count descending and country ascending.
*/
