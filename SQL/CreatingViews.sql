
-- Clean Sales View
CREATE VIEW V_CleanSales AS
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
FROM SalesTable;

--Products View
Create view Products as
select
CustomerID,
Product,
Sales
from SaleTable_Clean_Dedup


-- CustomerSalesSummary View
CREATE VIEW V_CustomerSalesSummary AS
SELECT
CustomerID,
SUM(Sales) TotalSales,
COUNT(OrderID) TotalOrders
FROM SaleTable_Clean_Dedup
GROUP BY CustomerID