-- Data Cleaning
select * from retail_sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantity is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

-- Data Exploration
-- How many sales we have?

Select Count(*) as Total_sale from retail_sales;

-- How many customer do we have?

select count(distinct customer_id) as Customer_Count from retail_sales;

-- How many catagories of distinct salesa re there?

select distinct category as Distinct_Catagory_Name from retail_sales;


----------------------------------------------------------------------------- DATA ANALYSIS ---------------------------------------------------------------------------------

-- find all rows for sale made on '05/11/2022'

select * from retail_sales
where sale_date = '05/11/2022';

-- write a query to retrive all transactions where the catagory is 'clothing' and the quantity sold is more than 3 in the month of november

select * from retail_sales
where category='Clothing'
and
quantity >3
and
MONTH(STR_TO_DATE(sale_date, '%d/%m/%Y')) = 11;


-- write a query to calculate the total sales (total_sales) for each catagory.

select category, sum(price_per_unit*quantity) as total_sales
from retail_sales
group by category;

-- write a query to find the average age of customers who purchased iteams from the 'Beauty' category

select category, round(avg(age),2) as Average_Age
from retail_sales
where category = 'Beauty'
group by category;

-- find  all transactions where the total_sale is grater than 1000

select * from retail_sales
where total_sale >1000;
 
-- find the total number of  transactions( transaction_id) made by each gender in each category

select category,gender, count(transactions_id) as total_transaction
from retail_sales
group by category,gender
order by category;

-- find average sales for each month, find the best selling month in each year

SELECT t.sale_year, t.sale_month, t.average_sale
FROM (
    SELECT 
        YEAR(STR_TO_DATE(sale_date, '%d/%m/%Y')) AS sale_year,
        MONTH(STR_TO_DATE(sale_date, '%d/%m/%Y')) AS sale_month,
        AVG(total_sale) AS average_sale
    FROM retail_sales
    GROUP BY sale_year, sale_month
) t
JOIN (
    SELECT sale_year, MAX(average_sale) AS max_avg_sale
    FROM (
        SELECT 
            YEAR(STR_TO_DATE(sale_date, '%d/%m/%Y')) AS sale_year,
            MONTH(STR_TO_DATE(sale_date, '%d/%m/%Y')) AS sale_month,
            AVG(total_sale) AS average_sale
        FROM retail_sales
        GROUP BY sale_year, sale_month
    ) x
    GROUP BY sale_year
) m
ON t.sale_year = m.sale_year AND t.average_sale = m.max_avg_sale
ORDER BY t.sale_year;

-- write a query to find the top 5 customers based on highest total sale

select customer_id, sum(total_sale) as total_sale
from retail_sales
group by customer_id
order by total_sale desc
limit 5;

-- write a query to find out the number of unique customers who purchased iteams from each catagory

select count(distinct customer_id) as customer,category
from retail_sales
group by category;

-- write a query to create each shift and number of orders 


with hourly_sales as
(select * ,
case 
when extract(hour from sale_time)<12 then 'Morning'
when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
else 'Evening'
end as shift
from retail_sales)

select shift,count(transactions_id) as no_orders
from hourly_sales
group by shift;

--- END OF PROJECT -----

























































