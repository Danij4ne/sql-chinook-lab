
/*
CHALLENGE 073 — Top 3 Invoices per Customer

Goal:
Return the top 3 highest-total invoices for each customer using a window function.

Instructions:
1) Query the table: invoice
2) For each customer, rank invoices using:
   - ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total DESC, invoice_id ASC) AS invoice_rank
3) Keep only rows where:
   - invoice_rank <= 3
4) Select exactly these columns (in this order):
   - customer_id
   - invoice_id
   - invoice_date
   - total
   - invoice_rank
5) Sort the final result by:
   - customer_id ASC
   - invoice_rank ASC
   - invoice_id ASC

Expected:
A result set with 5 columns:
customer_id, invoice_id, invoice_date, total, invoice_rank
For each customer, only the top 3 invoices by total, ordered by customer_id ascending, then invoice_rank ascending, then invoice_id ascending.
*/
