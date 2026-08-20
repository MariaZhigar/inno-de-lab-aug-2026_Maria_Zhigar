-- QUERY: Average daily revenue analysis by day of week

SELECT 
    d.DayName,						-- Select day name
    COUNT(DISTINCT d.DateKey)
    AS DaysCount,					-- Count how many times each weekday occurred in month
    SUM(fo.Quantity * fo.UnitPrice) 
    AS TotalRevenue,				-- Total revenue on certain days of the week
    SUM(fo.Quantity * fo.UnitPrice) / COUNT(DISTINCT d.DateKey) 
    AS AvgDailyRevenue,				-- Average revenue on certain days of the week
    SUM(fo.Quantity) 
    AS TotalPortions				-- Total portions
FROM 
	Fact_Orders AS fo
INNER JOIN 
	dim_date AS d
	ON fo.DateKey = d.DateKey
GROUP BY 
	d.DayName						-- Group by weekday name
ORDER BY 
    CASE d.DayName					-- Sort weekdays in calendar order
        WHEN 'Понедельник' THEN 1	-- CASE-based sorting: assign each day a number from 1 to 7
        WHEN 'Вторник' THEN 2
        WHEN 'Среда' THEN 3
        WHEN 'Четверг' THEN 4
        WHEN 'Пятница' THEN 5
        WHEN 'Суббота' THEN 6
        WHEN 'Воскресенье' THEN 7
    END;