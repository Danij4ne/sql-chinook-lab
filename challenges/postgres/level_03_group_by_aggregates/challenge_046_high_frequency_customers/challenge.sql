
/*
CHALLENGE 046 — Total Invoices per Customer

Goal:
Calculate how many invoices each customer has.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Join customer to invoice using:
   - customer.customer_id = invoice.customer_id
3) Group rows by:
   - customer.customer_id
   - customer.first_name
   - customer.last_name
4) Compute:
   - COUNT(invoice.invoice_id) AS invoice_count
5) Select exactly these columns (in this order):
   - customer_id
   - first_name
   - last_name
   - invoice_count
6) Filter groups where:
   - COUNT(invoice.invoice_id) >= 5
7) Sort the result by:
   - invoice_count DESC
   - customer_id ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, invoice_count
Only customers with at least 5 invoices, ordered by invoice_count descending and customer_id ascending.
*/
