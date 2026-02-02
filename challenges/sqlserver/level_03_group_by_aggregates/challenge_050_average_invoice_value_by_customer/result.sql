
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