/* 
List customers who have never purchased a Lurpak product.
Rationale: Anti-join pattern — LEFT JOIN ... IS NULL or NOT IN subquery. Tests exclusion logic.
*/

SELECT 
    c.customer_name,
    c.customer_type,
    c.state,
    p.brand AS brand_bought
FROM
    customers_arla c
LEFT JOIN sales_arla s
    ON c.customer_id = s.customer_id
LEFT JOIN products_arla p
    ON s.product_id = p.product_id
WHERE
    p.brand <> 'Lurpak';

--
/* RESULT: 
Dairy Dessert, Butter, Cooking Cream, Whipping Cream, Flavoured Milk, UHT Milk, and Cheese recorded the highest average discount of 4%, while Milk Powder and Yoghurt averaged slightly lower discounts at 3%.
*/