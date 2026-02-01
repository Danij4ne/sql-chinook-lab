
SELECT invoiceid , customerid , invoicedate , total 
FROM invoice 
WHERE invoicedate > '2010-01-01'
ORDER BY invoicedate ASC ;