-- QUERY: Average daily revenue analysis by day of week

SELECT 
    d.DayName,						-- Select day name
    COUNT(DISTINCT d.DateKey)
    AS DaysCount,					-- Count how many times each weekday occurred in period (in this case, a week)
    COALESCE(SUM(fo.Quantity * fo.UnitPrice), 0) 
    AS TotalRevenue,				-- Total revenue on certain days of the week
    COALESCE(SUM(fo.Quantity * fo.UnitPrice), 0) / COUNT(DISTINCT d.DateKey) 	-- COALESCE(x, 0) says: “if x is NULL, return 0.”
    AS AvgDailyRevenue,				-- Average revenue on certain days of the week
    SUM(fo.Quantity) 
    AS TotalPortions				-- Total portions
FROM 
    dim_date AS d
LEFT JOIN 
    Fact_OrderLines AS fo
    ON d.DateKey = fo.DateKey
WHERE
    d.fulldate BETWEEN '2026-08-01' AND '2026-08-08' -- Filter by period (in this case, a week)
GROUP BY 
	d.DayName,					-- Group by weekday name
	d.DayOfWeekNumber
ORDER BY 
    d.DayOfWeekNumber;
