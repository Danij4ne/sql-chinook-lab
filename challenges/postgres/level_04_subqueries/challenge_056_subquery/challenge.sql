
/*
CHALLENGE 056 — Invoices Above Average Total

Goal:
Return invoices whose total amount is higher than the average invoice total.

Instructions:
1) Query the table: invoice
2) Use a subquery to calculate:
   - the average value of invoice.total
3) Filter rows where:
   - invoice.total > (average invoice total)
4) Select exactly these columns (in this order):
   - invoice_id
   - customer_id
   - invoice_date
   - total
5) Sort the result by:
   - total DESC
   - invoice_id ASC

Expected:
A result set with 4 columns:
invoice_id, customer_id, invoice_date, total
Only invoices with a total greater than the average invoice total, ordered by total descending and invoice_id ascending.
*/
