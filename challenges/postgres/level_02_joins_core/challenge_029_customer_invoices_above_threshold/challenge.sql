
/*
CHALLENGE 029 — Customers with Invoices and Total Amount

Goal:
Return customers along with their invoices and invoice totals.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Join customer to invoice using:
   - customer.customer_id = invoice.customer_id
3) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - invoice.invoice_id
   - invoice.total
4) Filter rows where:
   - invoice.total >= 5.00
5) Sort the result by:
   - customer.customer_id ASC
   - invoice.total DESC

Expected:
A result set with 5 columns:
customer_id, first_name, last_name, invoice_id, total
Only invoices with a total greater than or equal to 5.00, ordered by customer_id ascending and invoice total descending.
*/
