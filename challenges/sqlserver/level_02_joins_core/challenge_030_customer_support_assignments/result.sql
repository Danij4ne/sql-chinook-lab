
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