# Retail Sales Analytics Project

## Project Overview

This project demonstrates an end-to-end data analytics workflow using SQL Server and Power BI. The dataset contained several data quality issues including missing values, duplicate records, inconsistent category naming, invalid dates, invalid ages, and negative sales values.

The objective of this project was to transform raw transactional sales data into a clean and structured dataset, perform business analysis using SQL, and build an interactive Power BI dashboard to uncover insights into customer behavior, product performance, regional sales trends, and overall business performance.

---

## Business Objectives

The project aims to answer key business questions such as:

* Which products generate the most revenue?
* Which regions contribute the most to total sales?
* Who are the highest-value customers?
* How do sales change over time?
* Which categories sell the most units?
* How much does each product contribute to overall revenue?
* What are the monthly sales trends and growth patterns?

---

## Dataset Overview

The dataset contains retail sales transactions with the following information:

* Order Details
* Customer Information
* Product Information
* Regional Data
* Pricing and Discount Information
* Sales Transactions

### Data Quality Issues Identified

* Duplicate records
* Missing ages
* Missing customer names
* Invalid ages
* Invalid dates
* Negative sales values
* Null discounts
* Inconsistent category names
* Inconsistent gender values

---

## Data Cleaning Process

A cleaned version of the dataset was created using SQL Server.

### Cleaning Tasks Performed

* Converted OrderDate to DATE format using TRY_CAST()
* Standardized Customer IDs
* Trimmed unnecessary whitespace from text fields
* Standardized Gender values
* Corrected inconsistent Category names
* Replaced invalid ages with NULL
* Replaced NULL discounts with 0
* Identified and handled negative sales values
* Removed duplicate records using ROW_NUMBER()

### Example Transformations

| Original Value | Cleaned Value |
| -------------- | ------------- |
| Furnitures     | Furniture     |
| electronics    | Electronics   |
| male           | Male          |
| NULL Discount  | 0             |

---

## Data Modeling

A simple star schema was implemented to support analytical reporting.

### Dimension Tables

#### dim_customers

Contains customer information:

* CustomerID
* CustomerName
* Gender
* Age
* Region
* City

### Fact Table

#### fact_sales

Contains transactional sales information:

* OrderID
* OrderDate
* CustomerID
* Product
* Category
* Quantity
* UnitPrice
* Discount
* Sales

---

## SQL Analysis Performed

### Executive KPIs

* Total Revenue
* Total Orders
* Total Customers
* Total Units Sold


### Customer Analysis

* Total Sales by Customer
* Top Customers by Revenue
* Revenue by Gender


### Product Analysis

* Total Sales by Product
* Best Selling Products
* Product Revenue Contribution (%)
* Product Ranking

### Regional Analysis

* Revenue by Region
* Quantity Sold by Region
* Top Performing Regions

### Time Series Analysis

* Monthly Sales Trends
* Month-over-Month Growth Analysis
* Running Revenue Totals

### Advanced SQL Concepts Used

* Common Table Expressions (CTEs)
* Window Functions
* ROW_NUMBER()
* LAG()
* RANK()
* Aggregate Functions
* CASE Statements
* Data Type Conversions
* Joins

---

## Power BI Dashboard

The Power BI dashboard consists of three pages:

### Executive Overview

* Total Revenue KPI
* Total Orders KPI
* Total Customers KPI
* Total Units Sold KPI
* Revenue Trend Analysis
* Revenue by Category
* Revenue by Region

### Customer Insights

* Revenue by Gender
* Revenue by Age Group
* Top Customers
* Customer Distribution by Region

### Product & Regional Performance

* Product Revenue Ranking
* Product Revenue Contribution
* Quantity Sold by Category
* Discount vs Revenue Analysis
* Top Products by Region

---

## Tools Used

* SQL Server
* SQL Server Management Studio (SSMS)
* Power BI Desktop
* GitHub

---

## Key Skills Demonstrated

* Data Cleaning
* Data Validation
* Data Modeling
* SQL Querying
* Window Functions
* Business Analysis
* Data Visualization
* Dashboard Development
* Data Storytelling

---

## Project Structure

```text
Retail-Sales-Analytics
│
├── Data
│   └── RetailSales.csv
│
├── SQL
│   ├── 01_Data_Quality_Checks.sql
│   ├── 02_Data_Cleaning.sql
│   ├── 03_Data_Modeling.sql
│   ├── 04_Executive_KPIs.sql
│   ├── 05_Customer_Analysis.sql
│   ├── 06_Product_Analysis.sql
│   ├── 07_Regional_Analysis.sql
│   └── 08_Time_Series_Analysis.sql
│
├── PowerBI
│   └── RetailSales.pbix
│   |__ Dashboard Screenshots
├── Screenshots
│   |__Query Screenshots
│   
│   
│
└── README.md
```

---

## Conclusion

This project demonstrates the complete analytics workflow from raw data preparation to business intelligence reporting. Through SQL-based data cleaning, dimensional modeling, analytical querying, and Power BI dashboard development, the project provides actionable insights into sales performance, customer behavior, and regional trends while showcasing practical data analyst skills used in real-world business environments.
