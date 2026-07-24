/*
Find products launched in 2023 or later that have generated more than ₦2,000,000 in total revenue.
Rationale: JOIN + GROUP BY + HAVING, combined with a WHERE filter on launch_year — tests filtering both before and after aggregation in the same query.
*/

 ---
 SELECT
    p.product_id,
    p.product_name,
    ROUND(
        SUM(s.quantity * s.unit_price_ngn),
        0
    ) AS total_revenue
FROM products_arla p
JOIN sales_arla s
    ON p.product_id = s.product_id
WHERE
    p.launch_year >= 2023
GROUP BY
    p.product_id,
    p.product_name
HAVING
    SUM(s.quantity * s.unit_price_ngn) > 2000000
ORDER BY
    total_revenue DESC;       

--
/* RESULT: 
Lurpak Unsalted Butter 400g generated the highest revenue (₦12.12M) among products launched since 2023, with Lurpak accounting for three of the top seven products.
*/