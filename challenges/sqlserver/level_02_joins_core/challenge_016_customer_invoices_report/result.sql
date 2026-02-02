
SELECT c.firstname , c.lastname , i.invoiceid , i.total
FROM  customer c
INNER JOIN invoice i
ON c.customerid = i.customerid 
ORDER BY  c.lastname ASC ;