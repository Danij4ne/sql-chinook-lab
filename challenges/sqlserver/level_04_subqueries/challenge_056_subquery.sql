
-- CHALLENGE 056 - CUSTOMERS ABOVE A TOTAL SPENDING THRESHOLD
-- Difficulty: MEDIUM
-- Topic: SUBQUERY IN WHERE
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers whose total spending is greater than a given threshold.
-- This challenge focuses on using a subquery in the WHERE clause.

-- REQUIREMENTS:
--   1. Consider a threshold of 100 in total spending.
--   2. Select the following columns from the Customer table:
--        - CustomerId
--        - FirstName
--        - LastName
--   3. Use a subquery on the Invoice table to:
--        - Calculate the SUM(Invoice.Total) per customer.
--        - Filter customers whose total spending is greater than 100.
--   4. Sort the results by LastName in ascending order.

SELECT c.CustomerId , c.FirstName , c.LastName
FROM customer c
WHERE 100 < (
    SELECT SUM(i.Total)
    FROM invoice i
    WHERE i.Customerid = c.Customerid
)
ORDER BY c.LastName ASC ;
