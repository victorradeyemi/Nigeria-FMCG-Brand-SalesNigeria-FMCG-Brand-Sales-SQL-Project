/*
Calculate net revenue per line (quantity × unit_price_ngn × (1 − discount_pct/100)) and find total net revenue per brand, ranked highest to lowest.
Rationale: JOIN + a computed expression inside SUM + GROUP BY. Tests whether discount is correctly factored into revenue rather than using list price.
*/

SELECT 
    p.brand,
    ROUND(
    SUM (s.quantity * s.unit_price_ngn * (1 - s.discount_pct/100)),
    0) AS brand_reveneue
FROM 
    products_arla p
INNER JOIN sales_arla s
    ON p.product_id = s.product_id
GROUP BY brand
ORDER BY brand_reveneue DESC;

--
/* RESULT: 
Lurpak generated the highest net revenue, followed by Castello and DANO.
*/
