/* 
Which product category has the highest average discount_pct given across all sales?
Rationale: JOIN + GROUP BY + AVG. Straightforward aggregation, but on a column (discount) rather than the more obvious revenue/quantity.
*/

SELECT
    p.category,
    ROUND(
    AVG(s.discount_pct),
    0) AS avg_discount
FROM
    sales_arla s 
JOIN products_arla p
    ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_discount DESC;   

--
/* RESULT: 
The products that showed highest discount was Dairy, Dessert, Butter, Cooking Cream; Whipping Cream; Flavoured & UHT Milk all having an avg discount of (4)
[
  {
    "category": "Dairy Dessert",
    "avg_discount": "4"
  },
  {
    "category": "Butter",
    "avg_discount": "4"
  },
  {
    "category": "Cooking Cream",
    "avg_discount": "4"
  },
  {
    "category": "Whipping Cream",
    "avg_discount": "4"
  },
  {
    "category": "Flavoured Milk",
    "avg_discount": "4"
  },
  {
    "category": "UHT Milk",
    "avg_discount": "4"
  },
  {
    "category": "Cheese",
    "avg_discount": "4"
  },
  {
    "category": "Milk Powder",
    "avg_discount": "3"
  },
  {
    "category": "Yoghurt",
    "avg_discount": "3"
  },
  {
    "category": "Cream Cheese",
    "avg_discount": "3"
  }
]
*/