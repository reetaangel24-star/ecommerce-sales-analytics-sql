Query 1: Fast-Moving Products

Products sold most frequently.

SELECT
    product_id,
    COUNT(*) AS units_sold
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY units_sold DESC
LIMIT 20;


Query 2: Slow-Moving Products
SELECT
    product_id,
    COUNT(*) AS units_sold
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY units_sold ASC
LIMIT 20;

Query 3: Product Revenue Contribution
SELECT
    product_id,
    ROUND(SUM(price),2) AS revenue
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 20;

Query 4: Top Product Categories by Revenue
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;

Query 5: Average Order Value (AOV)

One of the most important e-commerce KPIs.

SELECT
    ROUND(
        SUM(price) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM olist_order_items_dataset;

Query 6: Revenue Contribution Percentage
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue,
    ROUND(
        SUM(oi.price) * 100 /
        (SELECT SUM(price)
         FROM olist_order_items_dataset),
         2
    ) AS revenue_percentage
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;
