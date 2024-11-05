SELECT * FROM [dbo].[Lita Capstone_SalesData]

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
