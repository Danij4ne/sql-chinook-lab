
SELECT c.CustomerId , c.FirstName , c.LastName
FROM customer c
WHERE 100 < (
    SELECT SUM(i.Total)
    FROM invoice i
    WHERE i.Customerid = c.Customerid
)
ORDER BY c.LastName ASC ;