/*
List all sales transactions for the product "DANO Full Cream Milk Powder 400g", showing customer name and sale date.
Rationale: Two-table JOIN (sales → products) with a WHERE filter. The simplest warm-up query.
*/

SELECT 
    p.product_name,
    c.customer_name,
    s.sale_date
FROM
    products_arla p
INNER JOIN sales_arla s
     ON p.product_id = s.product_id
INNER JOIN customers_arla c
     ON c.customer_id = s.customer_id
WHERE
    p.product_name = 'DANO Full Cream Milk Powder 400g';      

--
/* RESULT: 
The results indicate that purchases of DANO Full Cream Milk Powder 400g occurred throughout the year and were made by customers from different business categories.
*/