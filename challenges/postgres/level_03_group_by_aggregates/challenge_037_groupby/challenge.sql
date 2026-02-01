
/*
CHALLENGE 037 — Invoice Count by Billing Country

Goal:
Calculate the number of invoices per billing country.

Instructions:
1) Query the table: invoice
2) Group rows by:
   - billing_country
3) Compute:
   - COUNT(invoice_id) AS invoice_count
4) Select exactly these columns (in this order):
   - billing_country
   - invoice_count
5) Filter groups where:
   - COUNT(invoice_id) >= 5
6) Sort the result by:
   - invoice_count DESC
   - billing_country ASC

Expected:
A result set with 2 columns:
billing_country, invoice_count
Only countries with at least 5 invoices, ordered by invoice_count descending and billing_country ascending.
*/
