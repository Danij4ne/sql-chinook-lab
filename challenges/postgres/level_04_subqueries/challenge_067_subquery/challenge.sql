
/*
CHALLENGE 067 — Customers with Most Recent Invoice Date

Goal:
Return customers along with their most recent invoice date.

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
   - MAX(invoice.invoice_date) AS most_recent_invoice_date
5) Select exactly these columns (in this order):
   - customer_id
   - first_name
   - last_name
   - most_recent_invoice_date
6) Filter rows where:
   - most_recent_invoice_date >= '2013-01-01'
7) Sort the result by:
   - most_recent_invoice_date DESC
   - customer_id ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, most_recent_invoice_date
Only customers whose most recent invoice date is on or after 2013-01-01, ordered by most_recent_invoice_date descending and customer_id ascending.
*/
