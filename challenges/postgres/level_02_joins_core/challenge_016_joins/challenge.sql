
/*
CHALLENGE 016 — Customers and Invoices

Goal:
Return a list of customers along with their invoices.

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
   - invoice.invoice_date
   - invoice.total
4) Sort the result by:
   - customer.customer_id ASC
   - invoice.invoice_date ASC

Expected:
A result set with 6 columns:
customer_id, first_name, last_name, invoice_id, invoice_date, total
Each row represents an invoice linked to its customer, ordered by customer and invoice date.
*/
