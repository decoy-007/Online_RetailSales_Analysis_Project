--Revenue contribution for each region
WITH RegionRevenue AS(
SELECT
c.Region,
SUM(fs.Sales) AS TotalSales
FROM fact_sales fs
JOIN dim_customers c
ON fs.customerID = c.CustomerID
GROUP BY c.Region
)
SELECT*,
SUM(TotalSales) OVER() OverallSales,
ROUND(TotalSales/SUM(TotalSales) OVER() * 100,1) RevenuePercentage
FROM RegionRevenue;

--Top Product in Each Region

WITH ProductSales AS
(
    SELECT
        c.Region,
        fs.Product,
        SUM(fs.Sales) TotalSales,

        ROW_NUMBER() OVER(
            PARTITION BY c.Region
            ORDER BY SUM(fs.Sales) DESC
        ) rn

    FROM fact_sales fs
    JOIN dim_customers c
        ON fs.CustomerID = c.CustomerID

    GROUP BY
        c.Region,
        fs.Product
)

SELECT *
FROM ProductSales
WHERE rn = 1;


--Total Quantity sold in each region

SELECT
SUM(fs.Quantity) TotalUnitsSold,
c.Region
FROM fact_sales fs
JOIN dim_customers c
ON fs.customerID = c.customerID
GROUP BY c.Region

