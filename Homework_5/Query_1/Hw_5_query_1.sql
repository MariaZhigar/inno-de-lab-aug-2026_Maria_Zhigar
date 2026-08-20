-- QUERY: Top-10 most popular dishes by number of portions ordered

SELECT
	dmi.Name,
	SUM(fo.quantity) AS amount_of_orders -- Sum the quantity of portions for each dish
FROM 
	fact_orders AS fo
INNER JOIN 
	dim_menu_item AS dmi
	ON fo.menuitemkey = dmi.menuitemkey 
GROUP BY
	dmi.Name							-- Group results by each dish
ORDER BY 
	amount_of_orders DESC				-- Sort in descending order (most popular first)
LIMIT 10;								-- Limit output to top 10 records