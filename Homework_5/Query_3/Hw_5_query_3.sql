-- QUERY: Average check per customer visit by restaurant zone

WITH visit_totals AS (
    SELECT 
        fo.VisitKey,
        fo.TableKey,
        SUM(fo.Quantity * fo.UnitPrice) AS check_amount
    FROM 
    	Fact_OrderLines AS fo
    GROUP BY 
    	fo.VisitKey, 
    	fo.TableKey
)
SELECT
    dt.Location,
    ROUND(AVG(vt.check_amount), 5) AS avg_check
FROM 
	visit_totals AS vt
INNER JOIN 
	dim_table AS dt 
    ON vt.TableKey = dt.TableKey
GROUP BY 							-- Group by location
	dt.Location
ORDER BY 
	avg_check DESC;