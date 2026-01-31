
-- CHALLENGE 030 - CUSTOMERS WITH THEIR SUPPORT REPRESENTATIVES
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers together with the employee assigned as their support representative.
-- This challenge focuses on joining Customer with Employee.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Customer.CustomerId
--        - Customer.FirstName AS CustomerFirstName
--        - Customer.LastName AS CustomerLastName
--        - Employee.FirstName AS RepFirstName
--        - Employee.LastName AS RepLastName
--   2. Join Customer → Employee using SupportRepId = EmployeeId.
--   3. Sort the results by RepLastName, then CustomerLastName.

SELECT
    c.CustomerId,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    e.FirstName AS RepFirstName,
    e.LastName AS RepLastName
FROM Customer c
INNER JOIN Employee e
    ON c.SupportRepId = e.EmployeeId
ORDER BY
    e.LastName,
    c.LastName;
