--Monhtly sales       
SELECT
MONTH(OrderDate) Month,
YEAR(OrderDate)Year,
SUM(Sales) TotalSales
FROM fact_sales
WHERE OrderDate IS NOT NULL
GROUP BY MONTH(OrderDate) ,
		 YEAR(OrderDate);

--Previous month sales and month over month change

with monthlySales as(
SELECT
MONTH(OrderDate) Month,
YEAR(OrderDate)Year,
SUM(Sales) TotalSales
FROM fact_sales
WHERE OrderDate IS NOT NULL
GROUP BY MONTH(OrderDate) ,
		 YEAR(OrderDate)
),
previous_month as(
SELECT*,
LAG(TotalSales) OVER(order by Month) PreviousMonth
FROM monthlySales
)
SELECT*,
TotalSales - PreviousMonth as MoM,
CASE 
	WHEN TotalSales > PreviousMonth THEN 'Increase'
	WHEN TotalSales < PreviousMonth THEN 'Decrease'
	ELSE 'No Change'
END Growth_Indicator
FROM previous_month

--Daily Running Total Revenue 
SELECT
    OrderDate,
    SUM(Sales) DailySales,

    SUM(SUM(Sales)) OVER(ORDER BY OrderDate) RunningTotal
FROM fact_sales
WHERE OrderDate IS NOT NULL
GROUP BY OrderDate;