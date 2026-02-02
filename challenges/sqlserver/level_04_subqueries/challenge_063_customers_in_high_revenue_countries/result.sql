

SELECT FirstName, LastName, Country
FROM Customer
WHERE Country IN (
    SELECT BillingCountry
    FROM Invoice
    GROUP BY BillingCountry
    HAVING SUM(Total) > 200
)
ORDER BY Country, LastName;
