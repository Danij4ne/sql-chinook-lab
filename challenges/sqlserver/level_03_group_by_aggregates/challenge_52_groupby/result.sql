
SELECT
    MONTH(InvoiceDate) AS InvoiceMonth,
    SUM(Total) AS TotalSales
FROM Invoice
GROUP BY MONTH(InvoiceDate)
ORDER BY InvoiceMonth ASC;