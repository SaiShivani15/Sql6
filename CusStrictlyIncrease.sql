WITH CTE AS (
    SELECT 
        customer_id, 
        YEAR(order_date) AS year, 
        SUM(price) AS price 
    FROM orders 
    GROUP BY customer_id, year
)
SELECT c1.customer_id 
FROM CTE c1 
LEFT JOIN CTE c2 
ON c1.customer_id = c2.customer_id 
   AND c1.year + 1 = c2.year 
   AND c1.price < c2.price 
GROUP BY c1.customer_id 
HAVING COUNT(c2.customer_id) = COUNT(c1.customer_id);
