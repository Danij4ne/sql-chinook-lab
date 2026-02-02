

SELECT
    Country,
    COUNT(CustomerId) AS CustomerCount
FROM Customer
GROUP BY
    Country
ORDER BY
    CustomerCount DESC;