-- 02_ex_GROUP_BY.sql
-- Count the total number of orders and average amount for each product

SELECT 
	item,			 -- Product name
	count(*),		 -- Aggregate function: counts the total number of orders for this product
	AVG(amount) 	 -- Aggregate function: calculates the average order amount for this product
	AS avg_amount	 -- Column alias
-- Source table
FROM
	orders
-- Group rows by product name
GROUP BY
	item
-- Products with the highest average amount come first, so, in descending order
ORDER BY
	avg_amount DESC;