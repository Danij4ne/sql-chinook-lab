
SELECT
    E.EmployeeId,
    E.FirstName AS EmployeeFirstName,
    E.LastName AS EmployeeLastName,
    M.FirstName AS ManagerFirstName,
    M.LastName AS ManagerLastName
FROM Employee AS E
JOIN Employee AS M
    ON E.ReportsTo = M.EmployeeId
ORDER BY
    ManagerLastName,
    EmployeeLastName;