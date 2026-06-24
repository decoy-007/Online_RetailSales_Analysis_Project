-- TotalSales for Each customer
SELECT
DISTINCT(CustomerID) CustomerID,
CustomerName,
SUM((Quantity * UnitPrice) - (Quantity*UnitPrice) *Discount) AS TotalSales
FROM SaleTable_Clean
group by CustomerID , CustomerName 
order by CustomerID 

--Revenue by Age Group
SELECT
    AgeGroup,
    SUM(Sales) TotalSales
FROM SaleTable_Clean_Dedup
GROUP BY AgeGroup;


--Revenue by Gender
SELECT
    c.Gender,
    SUM(fs.Sales) TotalSales
FROM fact_sales fs
JOIN dim_customers c
    ON fs.CustomerID = c.CustomerID
GROUP BY c.Gender;

