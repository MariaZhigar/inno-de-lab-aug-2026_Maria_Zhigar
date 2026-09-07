-- QUERY: Waiter revenue ranking for the period (in this case, a week)

SELECT
	ds.staffkey,
	CONCAT(ds.firstname, ' ', ds.lastname)			-- Concatenate first and last name of waiter with a space
	AS full_name_of_waiter,
	SUM(fo.Quantity * fo.UnitPrice) AS Revenue      -- Calculate revenue
FROM
	Fact_OrderLines AS fo
INNER JOIN 
	dim_staff AS ds 
	ON fo.waiterkey = ds.staffkey
INNER JOIN 
    dim_date AS dd 
    ON fo.datekey = dd.datekey
WHERE
    dd.fulldate BETWEEN '2026-08-01' AND '2026-08-08' -- Filter by period (in this case, a week)
GROUP BY 
	ds.staffkey										-- Group by each waiter
ORDER BY
	revenue DESC;									-- Sort descending by revenue
	