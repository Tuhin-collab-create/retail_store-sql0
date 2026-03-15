# Retail Sales Analysis (SQL)

## Project Overview
This project involves a comprehensive analysis of retail sales data using SQL. The goal is to clean raw transaction data, explore customer demographics, and extract actionable business insights such as top-selling categories, customer behavior by age, and peak sales periods.

## Dataset
**Retail Sales Dataset**: Includes 2,000 records of transaction data with columns for Transaction ID, Sale Date, Customer ID, Gender, Age, Product Category, Quantity, Price per Unit, COGS, and Total Sale.

## Technologies Used
* **Database:** MySQL / PostgreSQL
* **Language:** SQL (Data Definition, Data Manipulation, and Data Analysis)

## Project Structure

### 1. Database & Table Setup
* **Schema Creation:** Defined the structure for the `retail_sales` table.
* **Data Cleaning:** Identified and removed null values to ensure data integrity.
* **Table Altering:** Used `ALTER TABLE` to fix encoding issues in column names (e.g., `transactions_id`) and corrected typos like `quantiy` to `quantity`.

### 2. Exploratory Data Analysis (EDA)
* Determined the total number of transactions and unique customers.
* Identified distinct product categories (Clothing, Beauty, Electronics).

### 3. Business Analysis & Insights
* **Trend Analysis:** Identified the best-performing month for each year based on average sales.
* **Customer Segmentation:** Analyzed the average age of customers in the "Beauty" category and found the top 5 customers by total spend.
* **Time-Based Insights:** Created a "Shift" analysis (Morning, Afternoon, Evening) using `CASE` statements to determine when most orders occur.
* **Category Performance:** Calculated total sales and unique customer counts for each product category.

## Key SQL Techniques
* **Aggregations:** `SUM()`, `AVG()`, `COUNT()`, `MAX()`.
* **Grouping & Filtering:** `GROUP BY`, `HAVING`, `WHERE`.
* **Date Manipulation:** `STR_TO_DATE()`, `MONTH()`, `YEAR()`, `EXTRACT()`.
* **Advanced Logic:** Common Table Expressions (CTEs), Subqueries, and `CASE` statements.

## How to Run
1. Create a database named `sql_project_p2`.
2. Execute the `retail store table.sql` to set up the schema.
3. Use `altering table.sql` to clean up column names.
4. Run the queries in `Sales analysis(Main).sql` to view the analysis results.

---
*This project showcases my ability to manage data from raw ingestion to final business reporting using SQL.*
