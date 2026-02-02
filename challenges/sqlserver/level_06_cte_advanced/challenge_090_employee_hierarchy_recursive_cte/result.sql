
WITH employee_hierarchy AS (

    SELECT
        e.EmployeeId,
        e.FirstName,
        e.LastName,
        e.ReportsTo,
        0 AS [Level]
    FROM Employee e
    WHERE e.ReportsTo IS NULL

    UNION ALL

    SELECT
        e.EmployeeId,
        e.FirstName,
        e.LastName,
        e.ReportsTo,
        eh.[Level] + 1 AS [Level]
    FROM Employee e
    JOIN employee_hierarchy eh
        ON e.ReportsTo = eh.EmployeeId
)
SELECT
    EmployeeId,
    FirstName,
    LastName,
    ReportsTo,
    [Level]
FROM employee_hierarchy
ORDER BY
    [Level],
    LastName
OPTION (MAXRECURSION 100);