SELECT TOP (1000) [Invoice ID]
      ,[Branch]
      ,[City]
      ,[Customer type]
      ,[Gender]
      ,[Product line]
      ,[Unit price]
      ,[Quantity]
      ,[Tax 5%]
      ,[Total]
      ,[Date]
      ,[Time]
      ,[Payment]
      ,[cogs]
      ,[gross margin percentage]
      ,[gross income]
      ,[Rating]
  FROM [Supermarket_Data].[dbo].[supermarket_sales]




  select [Invoice ID],City,[Product line],[Unit price],Date,[gross income],Rating
  from [dbo].[supermarket_sales]
  order by 2,5


  alter table [dbo].[supermarket_sales]
  add DateFormatted date;


  update [dbo].[supermarket_sales]
  set DateFormatted = CONVERT(date,Date)



  select * 
  from [dbo].[supermarket_sales]
  where [Invoice ID] is null



  --EDA--


--Average Sales per product line


select [Product line],[Unit price],SUM(Total) as Total_Sales
from [dbo].[supermarket_sales]
group by [Product line],[Unit price]
order by 1,2



--Average Sales per product line


select [Product line],SUM(Total) as Dept_TotalSales,AVG(Total) as Avg_Sales
from [dbo].[supermarket_sales]
group by [Product line]
order by 1,



--Average rating per product line


select [Product line],AVG(Rating) as Avg_Rating
from [dbo].[supermarket_sales]
group by [Product line]



--Total quantity sold per city


select City,SUM(Quantity) as Total_Quantity
from [dbo].[supermarket_sales]
group by City



--Sales distribution by payment method


SELECT Payment, COUNT(*) AS Number_of_Sales
FROM supermarket_sales
GROUP BY Payment



--Daily sales trend


SELECT Date, SUM(Total) AS Total_Sales
FROM supermarket_sales
GROUP BY Date
ORDER BY Date



--Average unit price per product line


SELECT [Product line], AVG([Unit price]) AS Average_Unit_Price
FROM supermarket_sales
GROUP BY [Product line]



--Top 5 products by total sales


SELECT Top 5 ([Product line]), SUM(Total) AS Total_Sales
FROM supermarket_sales
GROUP BY [Product line]
ORDER BY Total_Sales DESC




--Total sales and average rating per branch


SELECT Branch, SUM(Total) AS Total_Sales, AVG(Rating) AS Average_Rating
FROM supermarket_sales
GROUP BY Branch



-------------------------------------------------------------------------------------------------------------------




