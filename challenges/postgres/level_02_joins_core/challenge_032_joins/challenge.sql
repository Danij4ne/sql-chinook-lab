
/*
CHALLENGE 032 — Invoice Lines with Customer Country

Goal:
Return invoice line items along with the country of the customer.

Instructions:
1) Query the tables:
   - invoice_line
   - invoice
   - customer
2) Join tables using:
   - invoice_line.invoice_id = invoice.invoice_id
   - invoice.customer_id = customer.customer_id
3) Select exactly these columns (in this order):
   - invoice_line.invoice_line_id
   - invoice_line.invoice_id
   - customer.country
   - invoice_line.unit_price
   - invoice_line.quantity
4) Filter rows where:
   - customer.country = 'Canada'
5) Sort the result by:
   - invoice_line.invoice_id ASC
   - invoice_line.invoice_line_id ASC

Expected:
A result set with 5 columns:
invoice_line_id, invoice_id, country, unit_price, quantity
Only invoice lines for customers from Canada, ordered by invoice_id ascending and invoice_line_id ascending.
*/
