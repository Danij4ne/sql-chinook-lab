
/*
CHALLENGE 023 — Invoice Lines with Invoice Date

Goal:
Return invoice line items along with the invoice date they belong to.

Instructions:
1) Query the tables:
   - invoice_line
   - invoice
2) Join invoice_line to invoice using:
   - invoice_line.invoice_id = invoice.invoice_id
3) Select exactly these columns (in this order):
   - invoice_line.invoice_line_id
   - invoice_line.invoice_id
   - invoice.invoice_date
   - invoice_line.track_id
   - invoice_line.unit_price
   - invoice_line.quantity
4) Filter rows where:
   - invoice.invoice_date >= '2013-01-01'
5) Sort the result by:
   - invoice.invoice_date ASC
   - invoice_line.invoice_line_id ASC

Expected:
A result set with 6 columns:
invoice_line_id, invoice_id, invoice_date, track_id, unit_price, quantity
Only invoice lines for invoices dated on or after 2013-01-01, ordered by invoice_date ascending and invoice_line_id ascending.
*/
