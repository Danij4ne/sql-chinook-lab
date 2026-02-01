
SELECT TOP 10 
       CONCAT(FirstName, ' ', LastName) AS FullName,
       Country
FROM Customer
ORDER BY LastName ASC;
