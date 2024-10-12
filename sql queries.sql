# 1. Total Sales by Date (in USD)
CREATE VIEW Total_Sales_By_Date AS
SELECT S.Order_Date, 
       SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY S.Order_Date
ORDER BY S.Order_Date;

select * from total_sales_by_date;

# 2. Top 10 Most Sold Products (by Quantity)
CREATE VIEW Top_10_Most_Sold_Products AS
SELECT P.Product_Name, SUM(S.Quantity) AS Total_Quantity_Sold
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
GROUP BY P.Product_Name
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

select * from top_10_most_sold_products;

#3. Top 5 Customers by Total Purchases (in USD)
CREATE VIEW Top_5_Customers_By_Purchases AS
SELECT C.CustomerKey, C.Name, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Purchases_USD
FROM sales S
JOIN customers C ON S.CustomerKey = C.CustomerKey
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY C.CustomerKey, C.Name
ORDER BY Total_Purchases_USD DESC
LIMIT 5;

select * from top_5_customers_by_purchases;

#4. Total Revenue by Product Category (in USD)
CREATE VIEW Total_Revenue_By_Category AS
SELECT P.Category, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Revenue_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY P.Category
ORDER BY Total_Revenue_USD DESC;

select * from total_revenue_by_category;

#5. Store Performance by Total Sales (in USD)
CREATE VIEW Store_Performance_By_Sales AS
SELECT S.StoreKey, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY S.StoreKey
ORDER BY Total_Sales_USD DESC;

select * from store_performance_by_sales;

#6. Average Order Value by Store (in USD)
CREATE VIEW Avg_Order_Value_By_Store AS
SELECT S.StoreKey, AVG(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Avg_Order_Value_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY S.StoreKey
ORDER BY Avg_Order_Value_USD DESC;

select * from avg_order_value_by_store;

#7. Sales by Customer Gender
CREATE VIEW Sales_By_Customer_Gender AS
SELECT C.Gender, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN customers C ON S.CustomerKey = C.CustomerKey
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY C.Gender;

select * from sales_by_customer_gender;

#8. Top 5 Brands by Total Sales (in USD)
CREATE VIEW Top_5_Brands_By_Sales AS
SELECT P.Brand, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY P.Brand
ORDER BY Total_Sales_USD DESC
LIMIT 5;

select * from top_5_brands_by_sales;

#9. Sales by Customer Continent
CREATE VIEW Sales_By_Continent AS
SELECT C.Continent, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN customers C ON S.CustomerKey = C.CustomerKey
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY C.Continent
ORDER BY Total_Sales_USD DESC;

select * from sales_by_continent;

#10. Most Profitable Products (by Profit Margin)
CREATE VIEW Most_Profitable_Products AS
SELECT P.Product_Name, SUM((P.Unit_Price_USD - P.Unit_Cost_USD) * S.Quantity * ER.Exchange) AS Total_Profit_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY P.Product_Name
ORDER BY Total_Profit_USD DESC;

select * from most_profitable_products;

#11. Product Sales by Color
CREATE VIEW Sales_By_Color AS
SELECT P.Color, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY P.Color
ORDER BY Total_Sales_USD DESC;

select * from Sales_By_Color;

#12. Store Sales by Square Meters
CREATE VIEW Sales_Per_Square_Meter AS
SELECT S.StoreKey, ST.Square_Meters, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) / ST.Square_Meters AS Sales_Per_Square_Meter
FROM sales S
JOIN stores ST ON S.StoreKey = ST.StoreKey
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_Rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY S.StoreKey, ST.Square_Meters
ORDER BY Sales_Per_Square_Meter DESC;

select * from Sales_Per_Square_Meter;

#13. Age of Customers vs. Total Purchases
CREATE VIEW Sales_By_Age_Group AS
SELECT CASE 
           WHEN TIMESTAMPDIFF(YEAR, C.Birthday, CURDATE()) BETWEEN 18 AND 25 THEN '18-25'
           WHEN TIMESTAMPDIFF(YEAR, C.Birthday, CURDATE()) BETWEEN 26 AND 35 THEN '26-35'
           WHEN TIMESTAMPDIFF(YEAR, C.Birthday, CURDATE()) BETWEEN 36 AND 45 THEN '36-45'
           WHEN TIMESTAMPDIFF(YEAR, C.Birthday, CURDATE()) BETWEEN 46 AND 55 THEN '46-55'
           ELSE '55+' 
       END AS Age_Group,
       SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN customers C ON S.CustomerKey = C.CustomerKey
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY Age_Group
ORDER BY Total_Sales_USD DESC;

select * from Sales_By_Age_Group;

#14. Store Opening Year and Performance
CREATE VIEW Store_Performance_By_Year AS
SELECT YEAR(ST.Open_Date) AS Store_Open_Year, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN stores ST ON S.StoreKey = ST.StoreKey
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_Rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY Store_Open_Year
ORDER BY Store_Open_Year DESC;

select * from Store_Performance_By_Year;

#15. Monthly Sales Trend
CREATE VIEW Monthly_Sales_Trend AS
SELECT YEAR(S.Order_Date) AS Year, MONTH(S.Order_Date) AS Month, SUM(S.Quantity * P.Unit_Price_USD * ER.Exchange) AS Total_Sales_USD
FROM sales S
JOIN products P ON S.ProductKey = P.ProductKey
JOIN exchange_Rates ER ON S.Order_Date = ER.Date AND S.Currency_Code = ER.Currency
GROUP BY YEAR(S.Order_Date), MONTH(S.Order_Date)
ORDER BY Year, Month;

select * from Monthly_Sales_Trend;