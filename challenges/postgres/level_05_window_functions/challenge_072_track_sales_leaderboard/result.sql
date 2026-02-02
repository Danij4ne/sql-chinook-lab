
WITH track_sales AS (
    SELECT
        t.track_id,
        t.name AS track_name,
        SUM(il.quantity) AS total_quantity_sold
    FROM invoice_line il
    JOIN track t
        ON il.track_id = t.track_id
    GROUP BY
        t.track_id,
        t.name
)
SELECT
    track_id,
    track_name,
    total_quantity_sold,
    DENSE_RANK() OVER (ORDER BY total_quantity_sold DESC) AS sales_rank
FROM track_sales
ORDER BY sales_rank ASC, track_id ASC;
