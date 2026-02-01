
SELECT
    Invoice.BillingCountry,
    SUM(Invoice.Total) AS TotalSales
FROM Invoice
GROUP BY
    Invoice.BillingCountry
ORDER BY
    TotalSales DESC;