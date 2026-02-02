
SELECT 
    e.EmployeeId,
    e.FirstName AS EmployeeFirstName,
    e.LastName AS EmployeeLastName,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName
FROM Employee e
INNER JOIN Customer c
    ON c.SupportRepId = e.EmployeeId
ORDER BY 
    e.LastName,
    c.LastName;