
/*
CHALLENGE 079 — Compare Invoice Total to Previous Invoice (Per Customer)

Goal:
Return each invoice with the previous invoice total for the same customer and the difference.

Instructions:
1) Query the table: invoice
2) Add a window function column:
   - LAG(total) OVER (PARTITION BY customer_id ORDER BY invoice_date ASC, invoice_id ASC) AS previous_total
3) Add a calculated column:
   - (total - previous_total) AS diff_from_previous
4) Select exactly these columns (in this order):
   - invoice_id
   - customer_id
   - invoice_date
   - total
   - previous_total
   - diff_from_previous
5) Filter rows where:
   - invoice_date >= '2013-01-01'
6) Sort the result by:
   - customer_id ASC
   - invoice_date ASC
   - invoice_id ASC

Expected:
A result set with 6 columns:
invoice_id, customer_id, invoice_date, total, previous_total, diff_from_previous
Only invoices dated on or after 2013-01-01, ordered by customer_id ascending, then invoice_date ascending, then invoice_id ascending.
*/
