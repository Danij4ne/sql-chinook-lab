
SELECT InvoiceId , InvoiceDate , Total ,
LAG(Total) OVER (ORDER BY InvoiceDate) AS PreviousTotal
FROM Invoice 
Order by InvoiceDate ;