
SELECT
    i.invoiceid,
    i.invoicedate,
    i.total,
    c.firstname,
    c.lastname
FROM invoice i
JOIN customer c
    ON i.customerid = c.customerid
ORDER BY i.invoicedate DESC;
