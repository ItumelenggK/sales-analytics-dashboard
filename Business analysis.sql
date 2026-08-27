SELECT
    COUNT(*) AS total_transactions,
    SUM(sales_amount) AS total_revenue,
    SUM(quantity_sold) AS total_units_sold,
    AVG(sales_amount) AS avg_transaction_value
FROM sales_analysis

--Which product categories are driving the business's recorded revenue, and how much of the total revenue does each category contribute?
SELECT
    product_category,
    SUM(sales_amount) AS total_revenue,
    ROUND(
        SUM(sales_amount) * 100.0 /
        SUM(SUM(sales_amount)) OVER (),
        2
    ) AS revenue_percentage
FROM sales_analysis
GROUP BY product_category
ORDER BY total_revenue DESC;

--Regional Performance
SELECT
    region,
    SUM(sales_amount) AS total_revenue,
    ROUND(
        SUM(sales_amount) * 100.0 /
        SUM(SUM(sales_amount)) OVER (),
        2
    ) AS revenue_percentage
FROM sales_analysis
GROUP BY region
ORDER BY total_revenue DESC;

--Monthly performance
SELECT
    sale_month,
    SUM(sales_amount) AS monthly_revenue,
    COUNT(*) AS transactions
FROM sales_analysis
GROUP BY sale_month
ORDER BY sale_month;

--We've identified that North is the highest-revenue region. We also know that Furniture is North's highest-revenue category. Let's find out exactly how much each category contributes within each region.
SELECT
    region,
    product_category,
    SUM(sales_amount) AS total_revenue,
    ROUND(
        SUM(sales_amount) * 100.0 /
        SUM(SUM(sales_amount)) OVER (PARTITION BY region),
        2
    ) AS regional_revenue_percentage
FROM sales_analysis
WHERE sale_date >= '2023-01-01'
  AND sale_date < '2024-01-01'
GROUP BY region, product_category
ORDER BY region, total_revenue DESC;

--sales performance versus cost
SELECT
    product_category,
    SUM(sales_amount) AS total_revenue,
    SUM(calculated_cost) AS total_calculated_cost,
    SUM(calculated_profit) AS total_calculated_profit
FROM sales_analysis
WHERE sale_date >= '2023-01-01'
  AND sale_date < '2024-01-01'
GROUP BY product_category
ORDER BY total_calculated_profit DESC;