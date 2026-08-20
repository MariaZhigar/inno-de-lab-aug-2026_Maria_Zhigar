-- QUERY: Menu items with zero sales in the period

SELECT
	dmi.MenuItemKey,
    dmi.Name,
    dmi.Category,
    dmi.CurrentPrice
FROM 
	dim_menu_item AS dmi				-- LEFT JOIN: keep all menu items, even if no matching orders exist
LEFT JOIN 
	fact_orders AS fo
	ON dmi.menuitemkey = fo.menuitemkey
WHERE
	fo.menuitemkey IS NULL 				-- Filter: keep only items with NO orders
ORDER BY
	dmi.category, dmi.name				-- Sort by category