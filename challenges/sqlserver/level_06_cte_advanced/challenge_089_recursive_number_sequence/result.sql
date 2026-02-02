
WITH numbers AS (
    -- Anchor member
    SELECT 1 AS num

    UNION ALL

    -- Recursive member
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT
    num
FROM numbers
OPTION (MAXRECURSION 100);