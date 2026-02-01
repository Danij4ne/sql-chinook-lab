
/*
CHALLENGE 085 — Top 5 Billing Cities by Total Revenue

Goal:
Return the top 5 billing cities by total invoice revenue using a CTE.

Instructions:
1) Create a CTE named city_revenue that:
   - queries invoice
   - groups by billing_city
   - computes SUM(total) AS total_revenue
2) Select exactly these columns (in this order) from the CTE:
   - billing_city
   - total_revenue
3) Sort the result by:
   - total_revenue DESC
   - billing_city ASC
4) Limit the result to:
   - 5 rows

Expected:
A result set with 2 columns:
billing_city, total_revenue
Only the top 5 billing cities by total_revenue, ordered by total_revenue descending and billing_city ascending.
*/
