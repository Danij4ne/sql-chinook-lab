
SELECT InvoiceId , InvoiceDate , Total  , 
LEAD(Total) OVER (ORDER BY InvoiceDate) AS NextTotal
FROM Invoice 
ORDER BY InvoiceDate ;