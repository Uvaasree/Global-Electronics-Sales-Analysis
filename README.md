# Global-Electronics-Sales-Analysis

## Overview

This repository contains the analysis of **Global Electronics** sales data using **MySQL** for data management and **Power BI** for dashboard visualizations. The project focuses on inserting, processing, and analyzing sales, product, customer, and store data, with key metrics displayed via views and dashboards.

## Project Structure

- **Data Ingestion**: Using **Pandas** and **PyMySQL** to load CSV data into a MySQL database.
- **Data Analysis**: Creating views to analyze various business metrics like total sales, top-selling products, and customer demographics.
- **Power BI**: Dashboards for visual representation of key performance indicators (KPIs).

## Data Sources

The project involves working with the following datasets:
- **Customers**: Information about the customers.
- **Sales**: Sales transactions.
- **Products**: Product catalog with pricing.
- **Stores**: Information about the stores.
- **Exchange Rates**: Used to convert sales to USD for consistent reporting.
  
## Data Handling 

Data Cleaning and Preparation
- missing values are handled appropriately.
- Data types are converted if necessary (e.g., dates, numerical values).
- Datasets are merged for analysis (e.g., linking sales data with product and customer data).
  
Load Data
- Insert the preprocessed data into an SQL database by creating relevant tables for each data source and using SQL INSERT statements to load the data.

## SQL Views

This project provides various SQL views for different aspects of the business. Here is a summary of the views created:

1. **Total Sales by Date (in USD)**  
   - Displays total sales for each date, converting the currency to USD using exchange rates.

2. **Top 10 Most Sold Products (by Quantity)**  
   - Shows the top 10 products with the highest sales volume.

3. **Top 5 Customers by Total Purchases (in USD)**  
   - Lists the top 5 customers with the highest purchase totals.

4. **Total Revenue by Product Category (in USD)**  
   - Summarizes the total revenue for each product category.

5. **Store Performance by Total Sales (in USD)**  
   - Ranks stores based on total sales in USD.

6. **Average Order Value by Store (in USD)**  
   - Shows the average order value per store.

7. **Sales by Customer Gender**  
   - Provides insights into sales by customer gender.

8. **Top 5 Brands by Total Sales (in USD)**  
   - Highlights the top 5 brands based on total sales.

9. **Sales by Customer Continent**  
   - Breaks down sales by the continent of the customers.

10. **Most Profitable Products (by Profit Margin)**  
    - Displays the products with the highest profit margins.

11. **Product Sales by Color**  
    - Analyzes sales by product color.

12. **Store Sales by Square Meters**  
    - Displays sales efficiency by square meters of the store.

13. **Sales by Customer Age Group**  
    - Categorizes sales by customer age group.

14. **Store Performance by Opening Year**  
    - Compares the performance of stores based on their opening year.

15. **Monthly Sales Trend**  
    - Shows the monthly sales trend across different years.


## Power BI Dashboards

The **Power BI** dashboards display various KPIs such as:
- **Total Sales by Date**
- **Top-selling Products**
- **Store Performance**
- **Customer Demographics**
- **Monthly Sales Trends**

## Future Work

- Adding machine learning models to predict future sales based on historical trends.
- Enhancing Power BI dashboards with interactive filters and real-time data analysis.

