
select * 
from [dbo].[burger_csales]



-- Count the number of orders

SELECT COUNT(DISTINCT order_id) AS total_orders 
FROM [dbo].[burger_csales]



-- Total sales revenue

SELECT SUM(total_price) AS total_revenue 
FROM [dbo].[burger_csales]



-- Average order value

SELECT AVG(total_price) AS average_order_value 
FROM [dbo].[burger_csales]



-- Most popular burger

SELECT burger_name_id, COUNT(*) AS count 
FROM [dbo].[burger_csales]
GROUP BY burger_name_id 
ORDER BY count DESC 



-- Sales by burger category

SELECT [Burger Category], SUM(total_price) AS total_sales 
FROM [dbo].[burger_csales]
GROUP BY [Burger Category]



-- Sales trend over time

SELECT order_date, SUM(total_price) AS daily_sales 
FROM [dbo].[burger_csales]
GROUP BY order_date 
ORDER BY order_date



-- Average quantity per order

SELECT AVG(quantity) AS average_quantity 
FROM [dbo].[burger_csales]



-- Sales by burger size

SELECT burger_size, SUM(total_price) AS total_sales 
FROM [dbo].[burger_csales]
GROUP BY burger_size 
ORDER BY total_sales DESC



--Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM [dbo].[burger_csales]
GROUP BY DATENAME(DW, order_date)



-- Monthly Trend for Orders

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from [dbo].[burger_csales]
GROUP BY DATENAME(MONTH, order_date)



--% of Sales by Burger Category

SELECT [Burger Category], CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [dbo].[burger_csales]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[burger_csales]
GROUP BY [Burger Category]



-- Percentage(%) of Sales by Burger Size

SELECT [burger_size], CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [dbo].[burger_csales]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[burger_csales]
GROUP BY [burger_size]
ORDER BY [burger_size]



--Top 5 Burger by Revenue

SELECT Top 5 [Burger Name], SUM(total_price) AS Total_Revenue
FROM [dbo].[burger_csales]
GROUP BY [Burger Name]
ORDER BY Total_Revenue DESC



-- Bottom 5 Burger by Revenue

SELECT Top 5 [Burger Name], SUM(total_price) AS Total_Revenue
FROM [dbo].[burger_csales]
GROUP BY [Burger Name]
ORDER BY Total_Revenue ASC



-- Top 5 Burger by Quantity

SELECT Top 5 [Burger Name], SUM(quantity) AS Total_Pizza_Sold
FROM [dbo].[burger_csales]
GROUP BY [Burger Name]
ORDER BY Total_Pizza_Sold DESC



-- Bottom 5 Burger by Quantity

SELECT TOP 5 [Burger Name], SUM(quantity) AS Total_Pizza_Sold
FROM [dbo].[burger_csales]
GROUP BY [Burger Name]
ORDER BY Total_Pizza_Sold ASC




--Total Burger Sold by Burger Category

SELECT [Burger Category], SUM(quantity) as Total_Quantity_Sold
FROM [dbo].[burger_csales]
WHERE MONTH(order_date) = 2
GROUP BY [Burger Category]
ORDER BY Total_Quantity_Sold DESC



-------------------------------------------------------------------------------------------------------------------
