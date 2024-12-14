--SQL Retails Sales Analysis - P1
CREATE DATABASE sql_project_p2;

-- Create TABLE
CREATE TABLE retail_sales
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(15),
		age INT,
		category VARCHAR(15),
		quantiy	INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale INT
	)

ALTER TABLE retail_sales
RENAME COLUMN quantiy to quantity;

SELECT * FROM retail_sales
LIMIT 10;

SELECT COUNT(*) FROM retail_sales;

-- Data Cleaning

SELECT * FROM retail_sales
WHERE transactions_id IS NULL;

SELECT * FROM retail_sales
WHERE sale_date IS NULL;

SELECT * FROM retail_sales
WHERE sale_time IS NULL;

SELECT * FROM retail_sales
WHERE customer_id IS NULL;

SELECT * FROM retail_sales
WHERE gender IS NULL;

SELECT * FROM retail_sales
WHERE age IS NULL;

SELECT * FROM retail_sales
WHERE 
	transactions_id IS NULL
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

DELETE FROM retail_sales
WHERE 
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	price_per_unit IS NULL
	OR 
	cogs IS NULL
	OR
	total_sale IS NULL;



-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as total_sales FROM retail_sales; 

-- How many UNIQUE customers we have?
SELECT COUNT(DISTINCT customer_id) as total_sales FROM retail_sales;

-- How many UNIQUE categories we have?
SELECT DISTINCT category FROM retail_sales;

SELECT COUNT(DISTINCT category) FROM retail_sales;


--Data Analysis & Business Key Problems & Answers

 -- Q. Write a SQL query to retrive all columns for sales made on '2022-11-05'

 SELECT * 
 FROM retail_sales
 WHERE sale_date = '2022-11-05';

 -- Q. Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
 	  --the quantity sold is more than 4 in the month of Nov-22

 SELECT *
 FROM retail_sales
 WHERE 
 	 category = 'Clothing'
 	   AND 
	 TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	   AND
	  quantity >= 4;

 
 -- Q. Write a SQL query to calculate the total sale for each category?

SELECT category, sum(total_sale) AS net_sale, COUNT(*) AS total_order
FROM retail_sales
GROUP BY 1;

-- Q. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' Category.

SELECT ROUND(avg(age),2) as avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q. Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * 
FROM retail_sales
WHERE total_sale > 1000;

-- Q. Write a SQL query to find the total number of transaction (transaction_id) made by each gender in each category.

SELECT category,Gender, COUNT(DISTINCT transactions_id) as Transction
FROM retail_sales
GROUP BY Category, Gender
ORDER BY Transction;


-- Q. Write a SQL query to find the top 5 customers based on the heighest total sales.

SELECT 
	customer_id, 
	SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY total_sales DESC
LIMIT 5;

-- Q. Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
	category,
	COUNT(DISTINCT customer_id) unique_custumer
FROM retail_sales
GROUP BY 1;

-- End of project