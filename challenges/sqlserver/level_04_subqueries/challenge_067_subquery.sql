
-- CHALLENGE 067 - CUSTOMERS WITH MORE INVOICES THAN A SPECIFIC CUSTOMER
-- Difficulty: MEDIUM
-- Topic: SUBQUERY WITH COUNT
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve customers who have more invoices than a specific reference customer.
-- This challenge focuses on comparing grouped counts using a subquery.

-- REQUIREMENTS:
--   1. Choose a specific reference customer by CustomerId (for example: 5).
--   2. Use a subquery to:
--        - Count how many invoices this reference customer has.
--   3. In the main query, select the following columns from Customer:
--        - CustomerId
--        - FirstName
--        - LastName
--   4. Compare each customer's invoice count against the reference customer's count.
--   5. Return only customers who have a higher invoice count than the reference.
--   6. Sort results by CustomerId.

-- Customers with more invoices than reference customer (example: CustomerId = 5)

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer c
JOIN Invoice i
    ON i.CustomerId = c.CustomerId
GROUP BY
    c.CustomerId, c.FirstName, c.LastName
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM Invoice
    WHERE CustomerId = 5
)
ORDER BY c.CustomerId;


