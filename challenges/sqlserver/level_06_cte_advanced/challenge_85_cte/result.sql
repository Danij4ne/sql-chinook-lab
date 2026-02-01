
WITH monthly_sales AS (
    SELECT
        YEAR(InvoiceDate)  AS [Year],
        MONTH(InvoiceDate) AS [Month],
        SUM(Total)         AS MonthlySales
    FROM Invoice
    GROUP BY
        YEAR(InvoiceDate),
        MONTH(InvoiceDate)
)
SELECT
    [Year],
    [Month],
    MonthlySales
FROM monthly_sales
ORDER BY
    [Year],
    [Month];