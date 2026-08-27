CREATE TABLE sales_data (
product_id int,
sale_date date,
sales_rep varchar(50),
region varchar(20),
sales_amount numeric(12,2),
quantity_sold int,
product_category varchar(30),
unit_cost numeric(12,2),
unit_price numeric(12,2),
customer_type varchar(20),
discount numeric(5,2),
payment_method varchar(30),
sales_channel varchar(20),
region_and_sales_rep varchar(50)
);

--DROP TABLE sales_data
SELECT * 
FROM sales_data
LIMIT 10;

--How many records do we have?
SELECT COUNT(*) AS total_rows
FROM sales_data

--Checking for duplicates
SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT(
product_id ,
sale_date ,
sales_rep ,
region,
sales_amount ,
quantity_sold ,
product_category ,
unit_cost ,
unit_price ,
customer_type ,
discount ,
payment_method ,
sales_channel ,
region_and_sales_rep 

)) AS unique_rows
FROM sales_data;

SELECT
COUNT(DISTINCT product_id) AS unique_products
FROM sales_data;


--Inspecting our categories
SELECT DISTINCT product_category
FROM sales_data;

SELECT DISTINCT region
FROM sales_data

SELECT DISTINCT sales_rep
FROM sales_data

SELECT DISTINCT customer_type
FROM sales_data

SELECT DISTINCT payment_method
FROM sales_data

SELECT DISTINCT sales_channel
FROM sales_data

--INSPECTING OUR NUMERICAL DATA
--checking the date range
SELECT 
	MIN(sale_date) AS earliest_sale,
	MAX(sale_date) AS latest_sale
FROM sales_data

SELECT * 
FROM sales_data
WHERE sale_date >= '2024-01-01'

--checking how many sales occured on each date
SELECT sale_date,
COUNT(*) AS number_of_sales
FROM sales_data
GROUP BY sale_date
ORDER BY sale_date DESC
LIMIT 10;

--INSPECTING SALES AMOUNT
SELECT MIN(sales_amount) AS minimum_sales,
MAX(sales_amount) AS maximum_sales,
 AVG(sales_amount) AS average_sales
FROM sales_data;

--QUANTITY SOLD
SELECT MIN(quantity_sold),
MAX(quantity_sold),
AVG(quantity_sold)
FROM sales_data

--Total quantity sold by each category
SELECT SUM(quantity_sold) AS total_quantity, product_category
FROM sales_data
GROUP BY product_category
ORDER BY total_quantity DESC

--Total revenue by each category
SELECT SUM(sales_amount) AS total_revenue_by_category, product_category
FROM sales_data
GROUP BY product_category
ORDER BY total_revenue_by_category DESC

--Total cost & profit
SELECT SUM(unit_cost * quantity_sold )AS total_cost, product_category
FROM sales_data
GROUP BY product_category
ORDER BY total_cost desc

SELECT
    product_id,
    quantity_sold,
    unit_cost,
    unit_price,
    discount,
    sales_amount,
    (unit_price * quantity_sold) AS expected_before_discount,
    (unit_price * quantity_sold * (1 - discount)) AS expected_after_discount
FROM sales_data
LIMIT 10;

-------------------------------------------Business Questions------------------------------------
--How much revenue did the business generate?
SELECT SUM(sales_amount) AS total_revenue
FROM sales_data

--What is the average revenue per transaction?
SELECT AVG(sales_amount)
FROM sales_data

--Which region generates the most recorded revenue?
SELECT region, SUM(sales_amount) AS revenue_per_region
FROM sales_data
GROUP BY region
ORDER BY revenue_per_region desc

--Which product categories generate the most revenue in the North?
SELECT  product_category,SUM(sales_amount) AS total_revenue
FROM sales_data
WHERE region= 'North'
GROUP BY 1
ORDER BY total_revenue desc

--How does North's recorded revenue change month by month?
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(sales_amount) AS monthly_revenue
FROM sales_data
WHERE region = 'North'
GROUP BY month
ORDER BY month desc;

--Sales representative performance
SELECT sales_rep, COUNT(*) AS transactions,
SUM(sales_amount) AS total_revenue,
AVG(sales_amount) AS avg_transaction_value
FROM sales_data
GROUP BY sales_rep
ORDER BY total_revenue DESC

--new and returning customers
SELECT customer_type, COUNT(*) AS transactions,
SUM(sales_amount) AS total_revenue,
AVG(sales_amount) AS avg_transaction_value
FROM sales_data
GROUP BY customer_type
ORDER BY total_revenue DESC

SELECT customer_type, product_category,
COUNT(*) AS transcations,
SUM(sales_amount) AS total_revenue,
AVG(sales_amount) AS avg_transaction_value
FROM sales_data
GROUP BY customer_type, product_category
ORDER BY customer_type, total_revenue DESC;

--Does the business generate more recorded revenue through Online or Retail sales?
SELECT sales_channel,
COUNT(*) AS transactions,
SUM(sales_amount) AS total_revenue,
AVG(sales_amount) AS avg_transaction_value
FROM sales_data
GROUP BY sales_channel
ORDER BY total_revenue

--Which payment methods are most commonly used and which generate the most revenue?
SELECT payment_method,
COUNT(*) AS transactions,
SUM(sales_amount) AS total_revenue,
AVG(sales_amount) AS avg_transaction_value
FROM sales_data
GROUP BY payment_method
ORDER BY total_revenue desc;

--Do higher dicounts lead to higher sales?
SELECT
    CASE
        WHEN discount < 0.10 THEN '0-10%'
        WHEN discount < 0.20 THEN '10-20%'
        ELSE '20-30%'
    END AS discount_band,
    COUNT(*) AS transactions,
    SUM(sales_amount) AS total_revenue,
    AVG(sales_amount) AS avg_transaction_value
FROM sales_data
GROUP BY discount_band
ORDER BY discount_band;


------------------------------------Analytical Dataset
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'sales_data'
ORDER BY ordinal_position;