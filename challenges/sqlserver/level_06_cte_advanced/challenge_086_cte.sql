
-- CHALLENGE 086 - CHAINED CTEs FOR CUSTOMER RANKING
-- Difficulty: MEDIUM
-- Topic: MULTIPLE CTEs + RANKING
-- Database: Chinook

-- DESCRIPTION:
-- Use multiple CTEs to calculate total spending per customer and assign a rank.

-- REQUIREMENTS:
--   1. First CTE:
--        - Joins Customer → Invoice.
--        - Calculates SUM(Invoice.Total) AS TotalSpent per customer.
--   2. Second CTE:
--        - Uses the first CTE.
--        - Adds a ranking column using a window function (for example, RANK).
--   3. In the main query, select:
--        - CustomerId
--        - TotalSpent
--        - Rank
--   4. Order results by TotalSpent in descending order.

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
