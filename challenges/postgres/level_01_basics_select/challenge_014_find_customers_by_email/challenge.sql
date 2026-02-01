
/*
CHALLENGE 014 — Find Customers by Email

Goal:
Return customers whose email address ends with a specific domain.

Instructions:
1) Query the table: customer
2) Select exactly these columns (in this order):
   - customer_id
   - first_name
   - last_name
   - email
3) Filter rows where:
   - email ILIKE '%@gmail.com'
4) Sort the result by:
   - email ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, email
Only customers with email addresses ending in "@gmail.com", ordered by email ascending.
*/
