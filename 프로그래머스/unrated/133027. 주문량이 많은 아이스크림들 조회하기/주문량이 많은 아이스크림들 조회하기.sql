SELECT FLAVOR
FROM(
    SELECT 
        FLAVOR,
        SUM(TOTAL_ORDER) AS TOTAL_ORDER
    FROM(
            (SELECT *
            FROM FIRST_HALF H)
            UNION ALL
            (SELECT *
            FROM JULY)
        )
    GROUP BY FLAVOR
    ORDER BY TOTAL_ORDER DESC
    )
FETCH FIRST 3 ROWS WITH TIES