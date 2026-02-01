
/*
CHALLENGE 028 — Invoices with Total and Customer Country

Goal:
Return invoices along with the country of the customer who made them.

Instructions:
1) Query the tables:
   - invoice
   - customer
2) Join invoice to customer using:
   - invoice.customer_id = customer.customer_id
3) Select exactly these columns (in this order):
   - invoice.invoice_id
   - invoice.invoice_date
   - customer.country
   - invoice.total
4) Filter rows where:
   - invoice.total > 10.00
5) Sort the result by:
   - invoice.total DESC

Expected:
A result set with 4 columns:
invoice_id, invoice_date, country, total
Only invoices with a total greater than 10.00, ordered by total descending.
*/
