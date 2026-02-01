

-- CHALLENGE 021 - EMPLOYEES AND THEIR CUSTOMERS
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve employees together with the customers they support.
-- This challenge focuses on joining Employee and Customer.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Employee.EmployeeId
--        - Employee.FirstName AS EmployeeFirstName
--        - Employee.LastName AS EmployeeLastName
--        - Customer.FirstName AS CustomerFirstName
--        - Customer.LastName AS CustomerLastName
--   2. Join Employee → Customer using SupportRepId = EmployeeId.
--   3. Sort the results by EmployeeLastName, then by CustomerLastName.
