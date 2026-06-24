--TotalSales by category
SELECT
Category,
SUM(Sales) TotalSales
FROM fact_sales
GROUP BY Category

--Total quantity sold by category
SELECT
Category,
SUM(Quantity) TotalUnitsSold
FROM fact_sales
GROUP BY category