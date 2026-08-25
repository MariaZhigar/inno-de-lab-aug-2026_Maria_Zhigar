-- QUERY: Menu items with zero sales in the week

SELECT
	dmi.MenuItemKey,
    dmi.Name,
    dmi.Category,
    dmi.CurrentPrice
FROM 
    dim_menu_item AS dmi
WHERE NOT EXISTS (				-- Check for any sale of this item in the week
    SELECT 1
    FROM 	
    	Fact_OrderLines AS fo
    INNER JOIN 
    	dim_date AS d 
        ON fo.DateKey = d.DateKey
    WHERE fo.MenuItemKey = dmi.MenuItemKey
      AND d.FullDate BETWEEN '2026-08-01' AND '2026-08-08'
)
ORDER BY
	dmi.category, 
	dmi.name					-- Sort by category