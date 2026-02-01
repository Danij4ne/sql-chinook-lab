
/*
CHALLENGE 081 — Customer Lifetime Value with CTE

Goal:
Calculate total spending (lifetime value) per customer using a CTE.

Instructions:
1) Create a CTE named customer_ltv that:
   - queries invoice
   - groups by customer_id
   - computes SUM(total) AS lifetime_value
2) Query the tables:
   - customer
   - customer_ltv (CTE)
3) Join customer to customer_ltv using:
   - customer.customer_id = customer_ltv.customer_id
4) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - customer.country
   - customer_ltv.lifetime_value
5) Filter rows where:
   - customer.country = 'USA'
6) Sort the result by:
   - customer_ltv.lifetime_value DESC
   - customer.customer_id ASC

Expected:
A result set with 5 columns:
customer_id, first_name, last_name, country, lifetime_value
Only customers from 'USA', ordered by lifetime_value descending and customer_id ascending.
*/
