
/*
CHALLENGE 055 — Total Revenue and Invoice Count by Country

Goal:
Calculate total revenue and invoice count per billing country.

Instructions:
1) Query the table: invoice
2) Group rows by:
   - billing_country
3) Compute:
   - SUM(total) AS total_revenue
   - COUNT(invoice_id) AS invoice_count
4) Select exactly these columns (in this order):
   - billing_country
   - total_revenue
   - invoice_count
5) Filter groups where:
   - COUNT(invoice_id) >= 5
6) Sort the result by:
   - total_revenue DESC
   - billing_country ASC

Expected:
A result set with 3 columns:
billing_country, total_revenue, invoice_count
Only countries with at least 5 invoices, ordered by total_revenue descending and billing_country ascending.
*/
