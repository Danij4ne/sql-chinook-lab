
SELECT 
    i.InvoiceLineId,
    i.InvoiceId,
    t.Name AS TrackName,
    t.UnitPrice
FROM InvoiceLine i
INNER JOIN Track t
    ON i.TrackId = t.TrackId
ORDER BY i.InvoiceId ASC;