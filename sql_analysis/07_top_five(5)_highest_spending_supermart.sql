/* 
Among Supermarket-type customers only, which customers generated the highest total spend?
Rationale: Three-condition query: JOIN + WHERE filter on customer_type + GROUP BY state + aggregation. Tests filtering before grouping.

NB: AGG FUNC for TOTAL SPEND 
total_spend = (price * quantity)
*/
---

SELECT
    c.customer_name,
    c.state,
    ROUND(
    SUM(s.unit_price_ngn * s.quantity),
     0
     ) AS total_spend
FROM
    customers_arla c   
JOIN  sales_arla s           
    ON c.customer_id = s.customer_id
WHERE customer_type = 'Supermarket'
GROUP BY c.state,
         c.customer_name
ORDER BY total_spend DESC
LIMIT 10;

--
/* Result: 
Palm Superstore led supermarket spending with ₦4.39M, while the top ten supermarkets each generated over ₦2.05M in total purchases.
*/