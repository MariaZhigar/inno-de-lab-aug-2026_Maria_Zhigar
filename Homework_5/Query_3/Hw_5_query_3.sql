-- QUERY: Average check per customer visit by restaurant zone

SELECT
	dt."location",
	ROUND(avg(fo.Quantity * fo.UnitPrice), 5) AS avg_check
FROM
	fact_orders AS fo 
INNER JOIN 
	dim_table AS dt
	ON fo.tablekey = dt.tablekey
GROUP BY
	dt."location" 			-- Group by location
ORDER BY
	avg_check DESC;			-- Sort descending by average check