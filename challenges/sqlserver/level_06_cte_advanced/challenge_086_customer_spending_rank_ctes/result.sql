
WITH customer_spending AS (
    SELECT
        c.CustomerId,
        SUM(i.Total) AS TotalSpent
    FROM Customer c
    JOIN Invoice i
        ON i.CustomerId = c.CustomerId
    GROUP BY
        c.CustomerId
),
ranked_customers AS (
    SELECT
        CustomerId,
        TotalSpent,
        RANK() OVER (ORDER BY TotalSpent DESC) AS [Rank]
    FROM customer_spending
)
SELECT
    CustomerId,
    TotalSpent,
    [Rank]
FROM ranked_customers
ORDER BY
    TotalSpent DESC;