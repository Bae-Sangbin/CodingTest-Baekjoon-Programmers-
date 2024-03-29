SELECT CAR_ID, CASE WHEN TOTAL_P = 0 THEN '대여 가능'ELSE '대여중' END AS AVAILABILITY 
FROM (
    SELECT CAR_ID, SUM(P) AS TOTAL_P
    FROM (
        SELECT CAR_ID, START_DATE, END_DATE,
        CASE WHEN TO_DATE('2022-10-16', 'YYYY-MM-DD') BETWEEN START_DATE AND END_DATE
        THEN 1 ELSE 0 END AS P
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY C)
    GROUP BY CAR_ID
)
ORDER BY CAR_ID DESC;