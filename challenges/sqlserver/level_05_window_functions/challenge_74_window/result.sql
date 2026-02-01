
SELECT
    InvoiceId,
    InvoiceDate,
    Total,
    SUM(Total) OVER (ORDER BY InvoiceDate) AS RunningTotal
FROM Invoice
ORDER BY InvoiceDate;