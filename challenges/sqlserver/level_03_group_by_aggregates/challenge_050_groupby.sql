
-- CHALLENGE 050 - AVERAGE INVOICE TOTAL PER CUSTOMER
-- Difficulty: MEDIUM
-- Topic: GROUP BY + AVG
-- Database: Chinook

-- DESCRIPTION:
-- Calculate the average invoice total for each customer.
-- This challenge focuses on grouping invoice totals per customer.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - Customer.CustomerId
--        - Customer.FirstName
--        - Customer.LastName
--        - AVG(Invoice.Total) AS AvgTotal
--   2. Join Customer → Invoice using CustomerId.
--   3. Group results by:
--        - Customer.CustomerId
--        - Customer.FirstName
--        - Customer.LastName
--   4. Sort results by AvgTotal in descending order.

SELECT 
    Customer.CustomerId,
    Customer.FirstName,
    Customer.LastName,
    AVG(Invoice.Total) AS AvgTotal
FROM Customer
JOIN Invoice 
    ON Customer.CustomerId = Invoice.CustomerId
GROUP BY 
    Customer.CustomerId,
    Customer.FirstName,
    Customer.LastName
ORDER BY AvgTotal DESC;
