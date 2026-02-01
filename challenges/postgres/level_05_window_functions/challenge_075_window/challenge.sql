
/*
CHALLENGE 075 — Invoice Total vs Customer Average

Goal:
Return invoices along with the customer’s average invoice total, and the difference between the invoice total and that average.

Instructions:
1) Query the table: invoice
2) Add a window function column:
   - AVG(total) OVER (PARTITION BY customer_id) AS customer_avg_total
3) Add a calculated column:
   - (total - customer_avg_total) AS diff_from_avg
4) Select exactly these columns (in this order):
   - invoice_id
   - customer_id
   - invoice_date
   - total
   - customer_avg_total
   - diff_from_avg
5) Filter rows where:
   - invoice_date >= '2013-01-01'
6) Sort the result by:
   - customer_id ASC
   - invoice_date ASC
   - invoice_id ASC

Expected:
A result set with 6 columns:
invoice_id, customer_id, invoice_date, total, customer_avg_total, diff_from_avg
Only invoices dated on or after 2013-01-01, ordered by customer_id ascending, then invoice_date ascending, then invoice_id ascending.
*/
