--Total sales by Product
Select
Product,
sum(sales) As totalSales
from fact_sales
group by product
order by totalSales desc

-- highest selling product
Select top 1
Product,
sum(sales) As totalSales
from fact_sales
group by product
order by totalSales desc

--how much each product contribute to the total sales
with totalProductSales as(
    Select
        Product,
        sum(sales) As totalSales
    from fact_sales
    group by product
)
Select*,
    SUM(totalSales) OVER() As overallTotal,
    ROUND(totalSales/SUM(totalSales) OVER()*100,1) percentageOfTotal
from totalProductSales
order by percentageOfTotal desc;