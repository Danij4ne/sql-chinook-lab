
SELECT
    il.InvoiceLineId,
    i.InvoiceDate,
    c.FirstName,
    c.LastName,
    il.UnitPrice,
    il.Quantity
FROM InvoiceLine il
INNER JOIN Invoice i
    ON il.InvoiceId = i.InvoiceId
INNER JOIN Customer c
    ON i.CustomerId = c.CustomerId
ORDER BY
    i.InvoiceDate DESC;