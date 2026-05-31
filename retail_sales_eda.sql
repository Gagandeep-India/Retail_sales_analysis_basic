USE Retail_sales;

  DROP TABLE IF EXISTS retail_salesretail_sales;

  CREATE TABLE 
  retail_sales(
  	transactions_id INT PRIMARY KEY,
  	sale_date DATE, 
  	sale_time TIME,
  	customer_id INT,
  	gender VARCHAR(20),
  	age INT,
  	category VARCHAR(20),
  	quantity INT,
  	price_per_unit FLOAT,
  	cogs FLOAT,
  	total_sale FLOAT
  );
  
SELECT * FROM retail_sales;

ALTER TABLE retail_sales
CHANGE COLUMN `quantiy` `quantity`
INT NULL DEFAULT NULL;

SELECT transactions_id , COUNT(transactions_id)
FROM retail_sales
GROUP BY transactions_id 
ORDER BY COUNT(transactions_id) DESC LIMIT 100;

SELECT COUNT(*) 
FROM retail_sales;

#Handling the Null values

SELECT * FROM 
retail_sales 
WHERE transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;

-- AS there are very few  null values so just delete it;

DELETE FROM retail_sales
WHERE transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;

-- DATA EXPLORATION

 -- How many sales we have 
 
 SELECT COUNT(*) AS total_sales FROM retail_sales;
 
 -- How many unique customers we have
 
 SELECT COUNT(DISTINCT customer_id ) FROM retail_sales;
 
 -- How many unique categories we have
 
 SELECT COUNT(DISTINCT category) FROM retail_sales;
 
 -- DATA ANALYSIS
 
 #1.retrieve all columns for sales  made on 2022-11-05
 
 SELECT *
 FROM retail_sales
 WHERE sale_date = '2022-11-05';
 
 
#2. retrieve all the transactions of the category Clothing and the quantity sold > 2 and done on the month Nov 2022

SELECT *
FROM retail_sales
WHERE 
category = 'Clothing'
AND
DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
AND 
quantity > 2;

#3.Calculate the total sale of each category

SELECT 
category,
SUM(total_sale) AS total_sale,
COUNT(*) AS no_of_orders
FROM retail_sales
GROUP BY category
ORDER BY SUM(total_sale) DESC;

#4. find the average age of the customers of the beauty category

SELECT 
category ,
ROUND(AVG(age), 2) AS AVG_age
FROM retail_sales 
WHERE 
category = 'Beauty'
GROUP BY category;

#5.find all the transactions where the total_sale is > 1000


SELECT * 
FROM retail_sales
WHERE total_sale > 1000;

#6. find the total number of transactions(transcation_id) made by each gender in each category 
 
SELECT 
category,
gender,
COUNT(*) AS number_of_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

#7.calculate the avg sale for each month, find out the best selling month in each year

SELECT * 
FROM 
(
SELECT
EXTRACT(YEAR FROM sale_date) as year,
EXTRACT(MONTH FROM sale_date) as month,
ROUND(AVG(total_sale),2) AS 'avg_sales',
RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY ROUND(AVG(total_sale),2) DESC) AS ranking
FROM retail_sales
GROUP BY 1, 2
) AS t1
WHERE ranking = 1;

-- ORDER BY EXTRACT(YEAR FROM sale_date), ROUND(AVG(total_sale),2) DESC;

#8. top 5 customers based on the highest total sales and ranking

SELECT * FROM retail_sales;

SELECT 
customer_id,
SUM(total_sale) AS customer_sales,
RANK() OVER(ORDER BY SUM(total_sale) DESC) Top_5
FROM retail_sales
GROUP BY customer_id 
-- ORDER BY customer_sales DESC
LIMIT 5;

#9.Number of unique customers who purchased items from each category

SELECT 
category,
COUNT(DISTINCT customer_id) AS 'Nr of customers'
FROM retail_sales
GROUP BY category;

#10.SQL query to create each shift and number of orders (Example: Morning <= 12, Afternoon Between 12 & 17, Evening > 17).CTE is also used

SELECT 
shift, 
COUNT(shift) AS 'number of orders'
FROM 
(SELECT *, 
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'morning' #the cases(morning, afternoon, etc..) which we are defining need to inside quotes
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
		ELSE 'evening'
	END AS shift
FROM retail_sales
)AS shifts
GROUP BY shift;

#OR
WITH hourly_sales
AS
(SELECT *, 
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'morning' #the cases(morning, afternoon, etc..) which we are defining need to inside quotes
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
		ELSE 'evening'
	END AS shift
FROM retail_sales
)

SELECT 
shift,
COUNT(shift) AS nr_of_orders
FROM hourly_sales
GROUP BY shift;

-- END  
































