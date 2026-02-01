
SELECT
    I.InvoiceId,
    I.InvoiceDate,
    I.Total,
    C.Country
FROM Invoice AS I
INNER JOIN Customer AS C
    ON I.CustomerId = C.CustomerId
WHERE I.Total > 10
ORDER BY
    C.Country,
    I.Total DESC;