
/*
CHALLENGE 031 — Invoices with Billing City and Customer Name

Goal:
Return invoices along with customer full name and billing city.

Instructions:
1) Query the tables:
   - invoice
   - customer
2) Join invoice to customer using:
   - invoice.customer_id = customer.customer_id
3) Select exactly these columns (in this order):
   - invoice.invoice_id
   - invoice.invoice_date
   - customer.first_name
   - customer.last_name
   - invoice.billing_city
   - invoice.total
4) Filter rows where:
   - invoice.billing_country = 'USA'
5) Sort the result by:
   - invoice.total DESC
   - invoice.invoice_date ASC

Expected:
A result set with 6 columns:
invoice_id, invoice_date, first_name, last_name, billing_city, total
Only invoices billed in 'USA', ordered by total descending and invoice_date ascending.
*/
