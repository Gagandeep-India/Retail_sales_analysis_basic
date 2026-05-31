USE Retail_sales;

--  DROP TABLE IF EXISTS retail_salesretail_sales;

--  CREATE TABLE 
--  retail_sales(
--  	transactions_id INT PRIMARY KEY,
--  	sale_date DATE, 
--  	sale_time TIME,
--  	customer_id INT,
--  	gender VARCHAR(20),
--  	age INT,
--  	category VARCHAR(20),
--  	quantiy INT,
--  	price_per_unit FLOAT,
--  	cogs FLOAT,
--  	total_sale FLOAT
--  );

SELECT transactions_id , COUNT(transactions_id)
FROM retail_sales
GROUP BY transactions_id 
ORDER BY COUNT(transactions_id) DESC LIMIT 100;

SELECT COUNT(*) 
FROM retail_sales;




