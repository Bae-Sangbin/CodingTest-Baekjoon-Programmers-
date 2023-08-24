SELECT
    HOUR,
    COUNT(ANIMAL_ID) AS COUNT
FROM(
        SELECT H.HOUR, A.ANIMAL_ID
        FROM (
                SELECT
                    ROWNUM - 1 AS HOUR
                FROM ANIMAL_OUTS
                WHERE ROWNUM <= 24)  H, 
                (    
                    SELECT 
                        ANIMAL_ID,
                        TO_CHAR(DATETIME, 'HH24') AS HOUR
                    FROM ANIMAL_OUTS ) A
        WHERE H.HOUR = A.HOUR(+)
    )
GROUP BY HOUR
ORDER BY HOUR
