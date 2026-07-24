/*
For each quarter of 2025, show total revenue by brand.
Rationale: Date functions (EXTRACT or DATE_TRUNC) combined with JOIN + GROUP BY on two dimensions (quarter and brand) — a small pivot-style question.
*/    


---
SELECT
    EXTRACT(QUARTER FROM s.sale_date) AS quarter,
    p.brand,
    ROUND(
        SUM(s.quantity * s.unit_price_ngn),
        0
    ) AS total_revenue
FROM products_arla p
JOIN sales_arla s
    ON p.product_id = s.product_id
WHERE EXTRACT(YEAR FROM s.sale_date) = 2025
GROUP BY
    EXTRACT(QUARTER FROM s.sale_date),
    p.brand
ORDER BY
    quarter,
    total_revenue DESC;

--
/* RESULT: 
Lurpak led revenue in Q1 with ₦29.05M, while DANO topped Q2 with ₦23.29M
*/