-- QUERY: Waiter revenue ranking for the period

SELECT
	ds.staffkey,
	CONCAT(ds.firstname, ' ', ds.lastname)			-- Concatenate first and last name of waiter with a space
	AS full_name_of_waiter,
	SUM(fo.Quantity * fo.UnitPrice) AS Revenue      -- Calculate revenue: 
FROM
	fact_orders AS fo
INNER JOIN 
	dim_staff AS ds 
	ON fo.waiterkey = ds.staffkey
GROUP BY 
	ds.staffkey										-- Group by each waiter
ORDER BY
	revenue DESC;									-- Sort descending by revenue
	