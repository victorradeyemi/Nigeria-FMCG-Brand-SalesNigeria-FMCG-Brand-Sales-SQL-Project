/* 
For each customer_type, show total quantity purchased and the number of distinct products bought.
Rationale: JOIN + GROUP BY + COUNT(DISTINCT ...) alongside SUM. Tests combining two different aggregate functions in one query.
*/

SELECT 
    c.customer_type,
    SUM(s.quantity) AS sum_of_quantity,
    COUNT(DISTINCT p.product_id) AS number_of_products
FROM customers_arla c
JOIN sales_arla s 
    ON c.customer_id = s.customer_id
JOIN products_arla p
    ON s.product_id = p.product_id       
GROUP BY customer_type;

--
/* RESULT: 
Convenience Stores purchased the highest quantity (20,464 units) and the widest product range (105 products), while Pharmacies recorded the lowest (5,502 units, 27 products).
*/