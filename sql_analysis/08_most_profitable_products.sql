/* 
Calculate profit margin (unit_price_ngn − unit_cost_ngn) for each product, and list the 10 most profitable products that have actually recorded at least one sale.
*/

 SELECT DISTINCT
    p.product_id,
    p.product_name,
    (p.unit_price_ngn - p.unit_cost_ngn) AS profit_margin
    FROM
    products_arla p
 LEFT JOIN sales_arla s
        ON p.product_id = s.product_id
 WHERE s.quantity >= 1
 ORDER BY profit_margin DESC
 LIMIT 10;

--
 /* RESULT: 
Lurpak Lighter Salted Butter 500g recorded the highest profit margin (₦3,140), with Lurpak occupying five of the top seven most profitable products.
*/
