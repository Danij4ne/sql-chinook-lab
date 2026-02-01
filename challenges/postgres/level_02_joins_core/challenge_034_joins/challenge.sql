
/*
CHALLENGE 034 — Employees and Customers by City

Goal:
Return employees and the customers they support, filtered by a specific customer city.

Instructions:
1) Query the tables:
   - employee
   - customer
2) Join customer to employee using:
   - customer.support_rep_id = employee.employee_id
3) Select exactly these columns (in this order):
   - employee.employee_id
   - employee.first_name AS employee_first_name
   - employee.last_name AS employee_last_name
   - customer.customer_id
   - customer.first_name AS customer_first_name
   - customer.last_name AS customer_last_name
   - customer.city AS customer_city
4) Filter rows where:
   - customer.city = 'Paris'
5) Sort the result by:
   - employee.last_name ASC
   - customer.last_name ASC

Expected:
A result set with 7 columns:
employee_id, employee_first_name, employee_last_name, customer_id, customer_first_name, customer_last_name, customer_city
Only customers from 'Paris' with their support reps, ordered by employee last name ascending and customer last name ascending.
*/
