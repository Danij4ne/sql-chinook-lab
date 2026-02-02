
/*
CHALLENGE 045 — Customers per Support Representative

Goal:
Calculate how many customers are assigned to each support representative.

Instructions:
1) Query the tables:
   - employee
   - customer
2) Join customer to employee using:
   - customer.support_rep_id = employee.employee_id
3) Group rows by:
   - employee.employee_id
   - employee.first_name
   - employee.last_name
4) Compute:
   - COUNT(customer.customer_id) AS customer_count
5) Select exactly these columns (in this order):
   - employee.employee_id
   - employee.first_name
   - employee.last_name
   - customer_count
6) Filter groups where:
   - COUNT(customer.customer_id) >= 5
7) Sort the result by:
   - customer_count DESC
   - employee.last_name ASC
   - employee.first_name ASC

Expected:
A result set with 4 columns:
employee_id, first_name, last_name, customer_count
Only employees with at least 5 customers, ordered by customer_count descending, then employee last name and first name ascending.
*/
