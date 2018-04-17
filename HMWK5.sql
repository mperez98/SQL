-- Q1 -- 
CREATE or replace view A5T1 AS
SELECT COUNT(*) AS order_count, SUM(tax_amount) AS tax_total, MAX(tax_amount) AS tax_max
FROM orders_mgs;

-- Q2 --
CREATE or replace view A5T2 AS
SELECT category_name, COUNT(*) AS product_count, MAX(list_price) AS most_expensive_product
FROM categories c JOIN products p
    ON c.category_id = p.category_id
GROUP BY category_name
ORDER BY product_count DESC;

-- Q3 -- 
CREATE or replace view A5T3 AS
SELECT email_address, SUM(item_price*quantity) AS item_price_total, SUM(discount_amount*quantity) AS discount_amount_total
FROM orders_mgs JOIN customers_mgs
    ON orders_mgs.customer_id = customers_mgs.customer_id
    JOIN order_items
        ON orders_mgs.order_id = order_items.order_id
GROUP BY email_address
ORDER BY item_price_total DESC;

-- Q4 --
CREATE or replace view A5T4 AS
SELECT email_address, COUNT(*) AS order_count, SUM((item_price-discount_amount)*quantity) AS order_total
FROM orders_mgs JOIN customers_mgs
    ON orders_mgs.customer_id = customers_mgs.customer_id
    JOIN order_items
        ON orders_mgs.order_id = order_items.order_id
GROUP BY email_address
HAVING COUNT(*) > 1
ORDER BY order_total DESC;

-- Q5 --
CREATE or replace view A5T5 AS
SELECT email_address, COUNT(*) AS order_count, SUM((item_price-discount_amount)*quantity) AS order_total
FROM orders_mgs JOIN customers_mgs
    ON orders_mgs.customer_id = customers_mgs.customer_id
    JOIN (SELECT * FROM order_items
        WHERE item_price >= 400) oi
        ON orders_mgs.order_id = oi.order_id
GROUP BY email_address
HAVING COUNT(*) > 1
ORDER BY order_total DESC;

-- Q6 --
CREATE or replace view A5T6 AS
SELECT email_address, COUNT(DISTINCT order_items.product_id) AS number_of_products
FROM orders_mgs JOIN customers_mgs
    ON orders_mgs.customer_id = customers_mgs.customer_id
    JOIN order_items
        ON orders_mgs.order_id = order_items.order_id
GROUP BY email_address
HAVING COUNT(DISTINCT order_items.product_id)>1
ORDER BY email_address;
