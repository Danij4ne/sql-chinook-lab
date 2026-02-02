
SELECT 
    i.BillingCountry,
    AVG(i.Total) AS AvgInvoiceTotal
FROM Invoice i
GROUP BY i.BillingCountry
ORDER BY AvgInvoiceTotal DESC;