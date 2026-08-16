-- 01_ex_Window_function.sql
-- Task: For each order add a column with the total amount of all orders by that customer

-- Select columns to display in the result set
SELECT 
	order_id,		-- Order's ID
	customer_id,	-- Customer's ID
	item,			-- Product name
	amount,			-- Amount of the specific order
	SUM(amount) 	-- -- Window function: sum of amounts
	OVER(PARTITION BY customer_id)		-- calculated separately per customer
	AS total_by_customer	-- Alias for the new column
FROM
	orders
-- Sort by order ID
ORDER BY 
	order_id 