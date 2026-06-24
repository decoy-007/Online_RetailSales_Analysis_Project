--=======================================================
                --Data Quality report check
--=======================================================

-- Invalid Dates
SELECT *
FROM SalesTable
WHERE TRY_CAST(OrderDate AS DATE) IS NULL;

-- Missing Names
SELECT *
FROM SalesTable
WHERE CustomerName IS NULL;

-- Invalid Ages
SELECT *
FROM SalesTable
WHERE Age < 18
   OR Age > 100;

-- Negative Sales
SELECT *
FROM SalesTable
WHERE Sales < 0;

-- Duplicate Orders
SELECT
    OrderID,
    COUNT(*) AS DuplicateCount
FROM SalesTable
GROUP BY OrderID
HAVING COUNT(*) > 1;
