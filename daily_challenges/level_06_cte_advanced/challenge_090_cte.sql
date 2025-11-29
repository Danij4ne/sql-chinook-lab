
-- CHALLENGE 090 - RECURSIVE CTE FOR MANAGEMENT HIERARCHY
-- Difficulty: MEDIUM
-- Topic: RECURSIVE CTE + HIERARCHY
-- Database: Chinook

-- DESCRIPTION:
-- Use a recursive CTE to explore the Employee management hierarchy.

-- REQUIREMENTS:
--   1. Base level:
--        - Select the top-level employees (those with ReportsTo IS NULL).
--   2. Recursive level:
--        - Join Employee with the CTE to find employees that report to the previous level.
--   3. Include columns:
--        - EmployeeId
--        - FirstName
--        - LastName
--        - ReportsTo
--        - A level or depth column indicating the hierarchy level.
--   4. Order results by the hierarchy level, then by LastName.
