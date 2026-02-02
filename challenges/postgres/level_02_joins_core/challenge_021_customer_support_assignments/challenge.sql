
/*
CHALLENGE 021 — Customers with Support Representatives

Goal:
Return customers along with their assigned support representative.

Instructions:
1) Query the tables:
   - customer
   - employee
2) Join customer to employee using:
   - customer.support_rep_id = employee.employee_id
3) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - employee.first_name AS support_rep_first_name
   - employee.last_name AS support_rep_last_name
4) Sort the result by:
   - employee.last_name ASC
   - customer.last_name ASC

Expected:
A result set with 5 columns:
customer_id, first_name, last_name, support_rep_first_name, support_rep_last_name
Each row represents a customer and their support representative, ordered by representative last name and customer last name.
*/
