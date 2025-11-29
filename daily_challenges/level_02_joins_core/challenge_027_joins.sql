
-- CHALLENGE 027 - EMPLOYEES AND THEIR MANAGERS
-- Difficulty: EASY
-- Topic: SELF JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve employees together with the manager they report to.
-- This challenge focuses on performing a self join within the Employee table.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - E.EmployeeId
--        - E.FirstName AS EmployeeFirstName
--        - E.LastName AS EmployeeLastName
--        - M.FirstName AS ManagerFirstName
--        - M.LastName AS ManagerLastName
--   2. Self join Employee AS E → Employee AS M using:
--        E.ReportsTo = M.EmployeeId
--   3. Sort the results by ManagerLastName, then EmployeeLastName.
