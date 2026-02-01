
/*
CHALLENGE 080 — Monthly Revenue with Month-over-Month Change

Goal:
Return monthly invoice revenue and the month-over-month revenue change.

Instructions:
1) Query the table: invoice
2) Create a month key as:
   - DATE_TRUNC('month', invoice_date)::date AS month_start
3) Aggregate monthly revenue as:
   - SUM(total) grouped by month_start
4) In the final result, add a window function column:
   - LAG(monthly_revenue) OVER (ORDER BY month_start ASC) AS previous_month_revenue
5) Add a calculated column:
   - (monthly_revenue - previous_month_revenue) AS revenue_change
6) Select exactly these columns (in this order):
   - month_start
   - monthly_revenue
   - previous_month_revenue
   - revenue_change
7) Sort the final result by:
   - month_start ASC

Expected:
A result set with 4 columns:
month_start, monthly_revenue, previous_month_revenue, revenue_change
Monthly revenue ordered by month_start ascending, including previous month revenue and the revenue change.
*/
