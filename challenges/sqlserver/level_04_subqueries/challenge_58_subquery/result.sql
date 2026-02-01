
SELECT CustomerId , FirstName , LastName
FROM Customer c
WHERE CustomerId IN (
    SELECT CustomerId
    FROM invoice i
)
ORDER BY LastName ASC ;