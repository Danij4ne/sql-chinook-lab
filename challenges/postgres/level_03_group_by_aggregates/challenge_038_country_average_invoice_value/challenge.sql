
/*
CHALLENGE 038 — Average Invoice Total by Country

Goal:
Calculate the average invoice total per billing country.

Instructions:
1) Query the table: invoice
2) Group rows by:
   - billing_country
3) Compute:
   - AVG(total) AS average_total
4) Select exactly these columns (in this order):
   - billing_country
   - average_total
5) Filter groups where:
   - AVG(total) >= 5.00
6) Sort the result by:
   - average_total DESC
   - billing_country ASC

Expected:
A result set with 2 columns:
billing_country, average_total
Only countries with an average invoice total of at least 5.00, ordered by average_total descending and billing_country ascending.
*/
