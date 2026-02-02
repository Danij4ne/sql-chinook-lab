
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName 
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Invoice i
    WHERE i.CustomerId = c.CustomerId
      AND YEAR(i.InvoiceDate) = 2010
)
ORDER BY c.LastName;