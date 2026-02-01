
/*
CHALLENGE 074 — Running Total of Invoice Revenue by Date

Goal:
Calculate the running total of invoice revenue over time.

Instructions:
1) Query the table: invoice
2) Aggregate invoice revenue per day as:
   - SUM(total) grouped by invoice_date
3) In the final result, add a window function column:
   - SUM(daily_total) OVER (ORDER BY invoice_date ASC) AS running_total
4) Select exactly these columns (in this order):
   - invoice_date
   - daily_total
   - running_total
5) Sort the final result by:
   - invoice_date ASC

Expected:
A result set with 3 columns:
invoice_date, daily_total, running_total
Daily invoice totals with a running total ordered by invoice_date ascending.
*/
