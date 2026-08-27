CREATE OR REPLACE VIEW sales_dashboard AS
SELECT
    product_id,
    sale_date,
    sale_month,
    sales_rep,
    region,
    product_category,
    customer_type,
    sales_channel,
    payment_method,
    quantity_sold,
    sales_amount,
    unit_cost,
    unit_price,
    discount
FROM sales_analysis
WHERE sale_date >= '2023-01-01'
  AND sale_date < '2024-01-01';

  SELECT *
FROM sales_dashboard
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM sales_dashboard;

SELECT
    MIN(sale_date) AS first_sale,
    MAX(sale_date) AS last_sale
FROM sales_dashboard;