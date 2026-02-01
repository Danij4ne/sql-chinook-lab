
SELECT
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate,
    i.Total
FROM Invoice i
WHERE i.Total > (
    SELECT AVG(i2.Total)
    FROM Invoice i2
    WHERE i2.CustomerId = i.CustomerId    
)
ORDER BY i.CustomerId, i.InvoiceDate;
