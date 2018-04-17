--Q1--
CREATE or replace view A6T1 as
SELECT DISTINCT category_name
FROM categories c
WHERE c.category_id IN
    (SELECT category_id 
    FROM products)
ORDER BY category_name;

--Q2--
CREATE or replace view A6T2 as
SELECT product_name, list_price
FROM products 
WHERE list_price > 
    (SELECT AVG(list_price)
    FROM products)
ORDER BY list_price DESC;

--Q3--
CREATE or replace view A6T3 as
SELECT product_name, discount_percent
FROM products p
WHERE p.discount_percent IN
    (SELECT discount_percent
    FROM products
    GROUP BY discount_percent
    HAVING COUNT(discount_percent) = 1)
ORDER BY product_name;

--Q3--
CREATE or replace view A6T4 as
SELECT vendor_name, vendor_city, vendor_state
FROM vendors v
WHERE v.vendor_state || v.vendor_city IN
    (SELECT vendor_state || vendor_city
    FROM vendors
    GROUP BY vendor_state || vendor_city
    HAVING COUNT(vendor_state || vendor_city) = 1)
ORDER BY vendor_state, vendor_city;
