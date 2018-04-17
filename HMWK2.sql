//Q1//
SELECT product_code, product_name, list_price, discount_percent
FROM Products
ORDER BY LIST_PRICE DESC;

//Q2//
SELECT last_name||', '||first_name AS full_name
FROM customers_mgs
WHERE last_name like 'E%' or last_name like 'G%' or last_name like 'F%'
ORDER BY last_name ASC;

//Q3//
SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 and list_price < 2000
ORDER BY date_added DESC;

//Q4//
SELECT product_name, list_price, discount_percent, 
(discount_percent/100) * list_price as discount_amount, list_price - ((discount_percent/100) * list_price) as discount_price
FROM products
WHERE ROWNUM <= 5
ORDER BY discount_price DESC;

//Q5//
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity as price_total, discount_amount * quantity as discount_total, (item_price - discount_amount) * quantity as item_total
FROM (SELECT * FROM order_items ORDER BY (item_price - discount_amount) * quantity DESC)
WHERE ROWNUM <= 6;

//Q6//
SELECT order_id, order_date, ship_date
FROM orders_mgs
WHERE ship_date is NULL;

//Q7//
SELECT SYSDATE AS today_unformatted,
       TO_CHAR (SYSDATE, 'MM-DD-YYYY') AS today_formatted
FROM Dual;

//Q8//
SELECT 100 AS price,
       .07 AS tax_rate,
       100 * .07 AS tax_amount,
       100 + (100 * .07) AS total
FROM Dual;
