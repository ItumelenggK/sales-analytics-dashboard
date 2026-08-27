CREATE OR REPLACE VIEW sales_analysis AS
SELECT
    product_id,
    sale_date,
    sales_rep,
    region,
    sales_amount,
    quantity_sold,
    product_category,
    unit_cost,
    unit_price,
    customer_type,
    discount,
    payment_method,
    sales_channel,

    unit_cost * quantity_sold AS calculated_cost,

    sales_amount - (unit_cost * quantity_sold) AS calculated_profit,

    DATE_TRUNC('month', sale_date)::date AS sale_month

FROM sales_data;

SELECT *
FROM sales_analysis
LIMIT 10;