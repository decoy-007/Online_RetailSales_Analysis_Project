--===================================================
                        --models
--===================================================

--customer model
Select DISTINCT
CustomerID,
CustomerName,
Gender,
Age,
Region,
City
INTO dim_customers
from SaleTable_Clean_Dedup

-- dates model
SELECT
OrderDate,
YEAR(OrderDate) AS OrderYear,
MONTH(OrderDate) AS OrderMonth,
DATENAME(MONTH,OrderDate) AS MonthName,
DATENAME(WEEKDAY,OrderDate) AS DayName
INTO dim_dates
FROM SaleTable_Clean_Dedup
WHERE OrderDate IS NOT NULL


--Fact sales model
Select 
	OrderID,
    OrderDate,
    CustomerID,
    Product,
	Category,
    Quantity,
    UnitPrice,
    Discount,
    Sales
INTO fact_sales
from SaleTable_Clean_Dedup
