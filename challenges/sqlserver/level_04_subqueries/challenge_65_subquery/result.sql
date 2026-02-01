
SELECT 
    InvoiceId,
    InvoiceDate,
    Total
FROM Invoice
WHERE Total > (
    SELECT AVG(Total)
    FROM Invoice
)
ORDER BY Total DESC;
