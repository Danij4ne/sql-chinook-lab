
SELECT 
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    COUNT(inv.InvoiceLineId) AS LineCount
FROM Customer c
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
JOIN InvoiceLine inv
    ON inv.InvoiceId = i.InvoiceId
GROUP BY
    c.FirstName,
    c.LastName,
    i.InvoiceId
ORDER BY
    LineCount DESC;