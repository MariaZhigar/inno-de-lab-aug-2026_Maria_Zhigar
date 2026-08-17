-- 01_ex_SUBQUERY.sql
-- Task: Find customers who placed the order with the maximum amount

-- Select columns to display in the result set
SELECT 
	c.first_name,	-- Customer's first name (from Customers table)
	c.last_name,	-- Customer's last name (from Customers table)
	o.amount		-- Order amount (from Orders table)
FROM
	customers AS c
	INNER JOIN orders AS o            --joining tables with inner join
	ON c.customer_id = o.customer_id 
WHERE o.amount = (					  -- Filter rows using a subquery
	SELECT MAX(amount) 
	FROM orders 
);