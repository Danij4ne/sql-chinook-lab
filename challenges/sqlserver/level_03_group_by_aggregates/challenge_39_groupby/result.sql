

SELECT
    mt.Name AS MediaTypeName,
    AVG(t.UnitPrice) AS AvgPrice
FROM Track t
JOIN MediaType mt
    ON t.MediaTypeId = mt.MediaTypeId
GROUP BY
    mt.Name
ORDER BY
    AvgPrice DESC;