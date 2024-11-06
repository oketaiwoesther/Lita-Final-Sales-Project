# Lita-Final-Project
### Project Title: Sales Analysis
### Project Overview
This data analysis project focuses on uncovering insights from last year's sales performance. Through careful analysis of key data metrics, we aim to gain valuable information that drives strategic decision-making. By identifying patterns and top-performing areas, we’ll create a clear narrative around the data, turning insights into actionable stories for enhanced understanding and results.

### Data Sources
The primary dataset for this analysis, Data_sales.csv, is an open-source file exclusively available for download to members of the Ladies in Tech Africa group. It can be accessed through various online platforms and open data repositories.

### Project Objective
This project was designed to address the following Analysis goals;

1. Perform an initial exploration of the sales data. Use pivot tables to summarize total sales by product, region, and month
2. Use Excel formulas to calculate metrics such as average sales per product and total revenue by region.
3. Create any other interesting report
4. Retrieve the total sales for each product category.
5. Find the number of sales transactions in each region.
6. Find the highest-selling product by total sales value.
7. Calculate total revenue per product.
8. Calculate monthly sales totals for the current year.
9. Find the top 5 customers by total purchase amount.
10. Calculate the percentage of total sales contributed by each region.
11. Identify products with no sales in the last quarter.
12. Create a dashboard that visualizes the insights found in Excel and SQL. The dashboard should include a sales overview, top-performing products, and regional breakdowns.

### Key Metrics
- Revenue: Some of the Revenue column group by Region
- Unit Sold: Some of the Units sold grouped by region
- Average Revenue: Calculated as Total Revenue/Tota Units sold for each region to measure the revenue efficiency
  
### How To Used The Data
- Revenue by Region: Group the Data by region and sum the revenue column, this provides overview of how much revenue each region is generating
- Units Sold by Region: Group the Data by Region and sum the units sold to identify which regions are moving the most products
- Average Revenue by Region: Calculate the Average Revenue per sale in each region to access performance

### Data Cleaning and Preparation
At the beginning of data cleaning and preparation, we carry out the following steps:
1. Data loading and Inspection
2. Handling missing variables
3. Data Cleaning and formatting


### Formular Used
```SELECT * FROM [dbo].[Lita Capstone_SalesData]

---The Total Sales for each product category.
SELECT Product,
	SUM([Quantity]) As TotalSales
FROM [Lita Capstone_SalesData]
GROUP BY PRODUCT;

---The Number Of Sales Transactions in each Region
SELECT Region,
	COUNT(*) As NumberofTransactions
FROM [Lita Capstone_SalesData]
GROUP BY Region;

--- The highest-selling product by total sales value.
SELECT Top 1 PRODUCT,
	SUM([Quantity]) AS TotalSales
FROM [Lita Capstone_SalesData]
GROUP BY PRODUCT
ORDER BY TotalSales DESC;

---Total Revenue Per Product.
SELECT PRODUCT,
	SUM([Revenue]) AS TotalRevenue
FROM [Lita Capstone_SalesData]
GROUP BY PRODUCT
ORDER BY TotalRevenue;

--- Monthly sales totals for the current year.
SELECT 
	DATENAME(MONTH, OrderDate) AS SalesMonth,
	SUM(Quantity) AS TotalSales
FROM 
    [dbo].[Lita Capstone_SalesData]
WHERE 
    YEAR(OrderDate) = YEAR(GETDATE()) 
GROUP BY 
    DATENAME(MONTH, OrderDate), MONTH(OrderDate)
ORDER BY 
    MONTH(OrderDate);  

	--- Top 5 customers by total purchase amount.
SELECT TOP 5 [Customer_Id] , 
       SUM([Revenue]) AS TotalPurchaseAmount
FROM [dbo].[Lita Capstone_SalesData]
GROUP BY [Customer_Id]
ORDER BY TotalPurchaseAmount DESC;

--- The percentage of total sales contributed by each region.
SELECT Region, 
       SUM([Quantity]) AS TotalSales, 
       ROUND((SUM([Quantity]) * 100 / (SELECT SUM([Quantity])
	   FROM [dbo].[Lita Capstone_SalesData])), 2) AS SalesPercentage
FROM [dbo].[Lita Capstone_SalesData]
GROUP BY Region;

---Products with no sales in the last quarter.
SELECT Product
FROM [dbo].[Lita Capstone_SalesData]
WHERE Product NOT IN (
    SELECT DISTINCT Product
    FROM [dbo].[Lita Capstone_SalesData]   
	WHERE OrderDate >= DATEADD(QUARTER, -1, GETDATE()) 
)
GROUP BY Product;

```

### Tools and Method Used
- Microsoft Excel  The Data was analysis using Microsoft Excel, utilizing pivot table to organize, summarize , and filter the Data for easier interpretation [Download Here](https://canvas.instructure.com/courses/10186984/files/folder/Capstone%20Project)
- SQL - Structured Query Language for Querying of Data
- Power BI - For Visualization
- GitHub for Portfolio Building

### Data Analysis
This is where we include some basic lines of code or queries or even some of the DAX expressions used during your analysis;

### Visual Analysis and inference
![image](https://github.com/user-attachments/assets/7316dcdf-f885-4912-835b-bac685d5c191)

![image](https://github.com/user-attachments/assets/5e688b10-a3cb-4d6c-a4b9-2f6831abdce9)

![Excel screen1](https://github.com/user-attachments/assets/6a61df4c-5ed4-4a6f-9184-901805f6d872)

![Excel screen2](https://github.com/user-attachments/assets/82cd8062-4d1c-45f0-b5f5-4ea99a882fac)


![Sales Power bi short](https://github.com/user-attachments/assets/81209fef-c3d2-4a03-8765-e5b62cab0486)




