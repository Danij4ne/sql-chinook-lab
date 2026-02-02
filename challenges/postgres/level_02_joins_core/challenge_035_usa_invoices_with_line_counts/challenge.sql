
/*
CHALLENGE 035 — Invoices with Customer and Invoice Line Count

Goal:
Return invoices with customer information and the number of invoice line items per invoice.

Instructions:
1) Query the tables:
   - invoice
   - customer
   - invoice_line
2) Join tables using:
   - invoice.customer_id = customer.customer_id
   - invoice.invoice_id = invoice_line.invoice_id
3) Aggregate results by invoice and customer to compute:
   - COUNT(invoice_line.invoice_line_id) AS line_count
4) Select exactly these columns (in this order):
   - invoice.invoice_id
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - invoice.total
   - line_count
5) Filter rows where:
   - invoice.billing_country = 'USA'
6) Sort the result by:
   - line_count DESC
   - invoice.total DESC

Expected:
A result set with 6 columns:
invoice_id, customer_id, first_name, last_name, total, line_count
Only invoices billed in 'USA', ordered by line_count descending and total descending.
*/
