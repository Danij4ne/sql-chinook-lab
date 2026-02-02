
/*
CHALLENGE 059 — Customers with No Invoices

Goal:
Return customers who have never made a purchase (no invoices).

Instructions:
1) Query the table: customer
2) Use a subquery to identify customers that appear in:
   - invoice.customer_id
3) Filter rows where:
   - customer.customer_id is NOT present in invoice.customer_id
4) Select exactly these columns (in this order):
   - customer_id
   - first_name
   - last_name
   - country
5) Sort the result by:
   - country ASC
   - last_name ASC
   - first_name ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, country
Only customers with no invoices, ordered by country ascending, then last name and first name ascending.
*/
