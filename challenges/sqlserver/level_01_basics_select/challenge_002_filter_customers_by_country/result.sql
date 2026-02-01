
SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Country
FROM Customer
WHERE Country = 'USA'
ORDER BY LastName ASC;