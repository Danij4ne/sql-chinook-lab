
/*
CHALLENGE 063 — Customers with Highest Invoice Total

Goal:
Return customers who have at least one invoice equal to the maximum invoice total.

Instructions:
1) Query the tables:
   - customer
   - invoice
2) Use a subquery to calculate:
   - the maximum value of invoice.total
3) Filter rows where:
   - invoice.total = (maximum invoice total)
4) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - invoice.invoice_id
   - invoice.total
5) Sort the result by:
   - customer.customer_id ASC

Expected:
A result set with 5 columns:
customer_id, first_name, last_name, invoice_id, total
Only customers with invoices equal to the maximum invoice total, ordered by customer_id ascending.
*/
