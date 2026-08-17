-- Part7.sql

SELECT 
	-- Concatenate first and last name with a space
	CONCAT(c.first_name, ' ', c.last_name)
	AS full_name,		-- Column alias
	c.country,			-- Customer's country
	-- Aggregate: count the number of orders per customer
	COUNT(*)
	AS total_orders, 	-- Column alias
	-- Aggregate: sum of all order amounts per customer
	SUM(o.amount)
	AS total_amount		-- Column alias
-- Primary table
FROM
	Customers AS c
	INNER JOIN 			-- Join with orders
    Orders 
    AS o 
    ON c.customer_id = o.customer_id	-- Link by customer ID
-- Using a subquery with EXISTS
WHERE EXISTS (
	-- SELECT 1 is a placeholder
    SELECT 1 
    FROM Shippings AS s 
    WHERE s.customer = c.customer_id 	
    AND s.status = 'Delivered'			-- Check the shipping status
)
GROUP BY
	c.customer_id
-- Filter grouped data: keep only customers with 2 or more orders
HAVING
	COUNT(*) >= 2
-- Sort result by customer's full name (alphabetical order)
ORDER BY
	full_name;

	

	