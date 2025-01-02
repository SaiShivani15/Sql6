#Approach 1:
Select round(sqrt(min(pow(p2.x-p1.x,2)+pow(p2.y-p1.y,2))),2) as ‘shortest’ from point2d p1 inner join point2d p2 on (p1.x>=p2.x and p1.y>p2.y) or (p1.x<=p2.x and p1.y>p2.y) or (p1.x<p2.x and p1.y=p2.y);



#Approach 2:
WITH RankedDistances AS (
    SELECT 
        p1.x AS x1, p1.y AS y1, p2.x AS x2, p2.y AS y2,
        SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2)) AS distance,
        RANK() OVER (ORDER BY SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2))) AS rank
    FROM Point2D p1
    INNER JOIN Point2D p2
    ON (p1.x != p2.x OR p1.y != p2.y)
)
SELECT ROUND(distance, 2) AS 'shortest'
FROM RankedDistances
WHERE rank = 1;
