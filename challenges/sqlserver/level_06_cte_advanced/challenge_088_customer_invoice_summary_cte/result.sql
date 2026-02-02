
WITH customer_invoices AS (
    SELECT
        CustomerId,
        COUNT(InvoiceId) AS InvoiceCount,
        SUM(Total)      AS TotalSpent
    FROM Invoice
    GROUP BY
        CustomerId
)
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    ci.InvoiceCount,
    ci.TotalSpent
FROM Customer c
JOIN customer_invoices ci
    ON ci.CustomerId = c.CustomerId
ORDER BY
    ci.TotalSpent DESC;