
SELECT
    InvoiceId,
    BillingCountry,
    Total,
    RANK() OVER (
        PARTITION BY BillingCountry
        ORDER BY Total DESC
    ) AS SalesRank
FROM Invoice
ORDER BY BillingCountry, SalesRank;