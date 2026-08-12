-- Part7.sql
SELECT 
	CONCAT(c.first_name, ' ', c.last_name)
	AS full_name,
	c.country,
	COUNT(*)
	AS total_orders,
	SUM(o.amount)
	AS total_amount
FROM
	Customers AS c
	INNER JOIN 
    Orders 
    AS o 
    ON c.customer_id = o.customer_id
WHERE EXISTS (
    SELECT 1 
    FROM Shippings AS s 
    WHERE s.customer = c.customer_id 
    AND s.status = 'Delivered'
)
GROUP BY
	c.customer_id
HAVING
	COUNT(*) >= 2
ORDER BY
	full_name;

	

	