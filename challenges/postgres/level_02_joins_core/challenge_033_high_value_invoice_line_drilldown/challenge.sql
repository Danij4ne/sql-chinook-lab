
/*
CHALLENGE 033 — Customers, Invoices, and Invoice Lines

Goal:
Return customers with their invoices and corresponding invoice line items.

Instructions:
1) Query the tables:
   - customer
   - invoice
   - invoice_line
2) Join tables using:
   - customer.customer_id = invoice.customer_id
   - invoice.invoice_id = invoice_line.invoice_id
3) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - invoice.invoice_id
   - invoice_line.invoice_line_id
   - invoice_line.unit_price
   - invoice_line.quantity
4) Filter rows where:
   - invoice.total >= 10.00
5) Sort the result by:
   - customer.customer_id ASC
   - invoice.invoice_id ASC
   - invoice_line.invoice_line_id ASC

Expected:
A result set with 7 columns:
customer_id, first_name, last_name, invoice_id, invoice_line_id, unit_price, quantity
Only invoices with total >= 10.00, ordered by customer, invoice, and invoice line.
*/
