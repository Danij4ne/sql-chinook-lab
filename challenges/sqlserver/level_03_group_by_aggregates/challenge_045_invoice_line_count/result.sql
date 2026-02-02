
SELECT
    il.InvoiceId,
    COUNT(il.InvoiceLineId) AS LineCount
FROM InvoiceLine il
GROUP BY il.InvoiceId
ORDER BY LineCount DESC;