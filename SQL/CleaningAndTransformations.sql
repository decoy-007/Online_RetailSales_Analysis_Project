-- Cleaning and transforming the data set


--Create a clean table for analyis
SELECT
	CAST(OrderID AS int) OrderID,
	TRY_CAST(OrderDate AS date) OrderDate,
	UPPER( CustomerID) CustomerID,
	TRIM(CustomerName) CustomerName,
	CASE
    WHEN LOWER(Gender) = 'male' THEN 'Male'
    WHEN LOWER(Gender) = 'female' THEN 'Female'
    ELSE 'Unknown'
END AS Gender,
	CASE
		WHEN Age BETWEEN 17 AND 100 THEN Age
		ELSE NULL
	END Age,
	TRIM(City) City,
	TRIM(Region) Region,
	TRIM(Product) Product,
	 CASE
        WHEN LOWER(Category) IN ('furniture','furnitures')
            THEN 'Furniture'
        WHEN LOWER(Category) = 'electronics'
            THEN 'Electronics'
        ELSE Category
    END AS Category,
	CAST(Quantity AS int) Quantity,
	CAST(UnitPrice AS decimal) UnitPrice,
	ISNULL(TRY_CAST(Discount AS decimal (5,2)),0
	) Discount,
	CASE 
		WHEN Sales < 0 THEN NULL
		ELSE TRY_CAST(Sales AS decimal)
	END Sales,
	CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    ELSE '46+'
END AgeGroup
INTO SaleTable_Clean
FROM SalesTable;


--Duplicate clean table to remove duplicate records for analyis
WITH Duplicates AS
(
    SELECT *,
        ROW_NUMBER() OVER(
            PARTITION BY OrderID
            ORDER BY OrderID
        ) AS rn
    FROM SaleTable_Clean
)

SELECT
    OrderID,
    OrderDate,
    CustomerID,
    CustomerName,
    Gender,
    Age,
    City,
    Region,
    Product,
    Category,
    Quantity,
    UnitPrice,
    Discount,
    Sales
INTO SaleTable_Clean_Dedup
FROM Duplicates
WHERE rn = 1;


ALTER Table SaleTable_Clean_Dedup
ADD AgeGroup VARCHAR(50)

UPDATE SaleTable_Clean_Dedup
SET AgeGroup = 
	CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    ELSE '46+'
END;



