
/*
CHALLENGE 022 — Invoices with Customer and Support Representative

Goal:
Return invoices along with customer and support representative information.

Instructions:
1) Query the tables:
   - invoice
   - customer
   - employee
2) Join tables using:
   - invoice.customer_id = customer.customer_id
   - customer.support_rep_id = employee.employee_id
3) Select exactly these columns (in this order):
   - invoice.invoice_id
   - invoice.invoice_date
   - customer.first_name
   - customer.last_name
   - employee.first_name AS support_rep_first_name
   - employee.last_name AS support_rep_last_name
   - invoice.total
4) Sort the result by:
   - invoice.invoice_date ASC

Expected:
A result set with 7 columns:
invoice_id, invoice_date, first_name, last_name, support_rep_first_name, support_rep_last_name, total
Each row represents an invoice with its customer and support representative, ordered by invoice date ascending.
*/
