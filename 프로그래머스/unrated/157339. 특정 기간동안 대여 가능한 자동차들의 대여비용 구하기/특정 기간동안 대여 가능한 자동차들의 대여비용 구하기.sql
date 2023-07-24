-- 코드를 입력하세요
SELECT *
FROM (
    SELECT 
        DISTINCT
        CAR_ID,
        CAR_TYPE,
        ROUND(30 * (DAILY_FEE - (DAILY_FEE * DC_RATE)), 0) AS FEE
    FROM 
        (
        SELECT 
            CAR_ID,
            CAR_TYPE,
            DAILY_FEE,
            RENTAL_PERIOD, 
            CASE WHEN CAR_TYPE = '세단' THEN (SELECT DISCOUNT_RATE / 100
                                           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                           WHERE CAR_TYPE = '세단'
                                           AND DURATION_TYPE = '30일 이상')
                WHEN CAR_TYPE = 'SUV' THEN (SELECT DISCOUNT_RATE / 100
                                           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                           WHERE CAR_TYPE = 'SUV'
                                           AND DURATION_TYPE = '30일 이상') 
                ELSE 0.00 END AS DC_RATE      
        FROM (
        SELECT 
            C.CAR_ID,
            C.CAR_TYPE,
            C.DAILY_FEE,
            H.END_DATE - H.START_DATE + 1 AS RENTAL_PERIOD
        FROM CAR_RENTAL_COMPANY_CAR C, CAR_RENTAL_COMPANY_RENTAL_HISTORY H
        WHERE C.CAR_ID = H.CAR_ID
        AND C.CAR_TYPE IN ('세단', 'SUV')
        AND C.CAR_ID NOT IN (SELECT CAR_ID
                            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                            WHERE 
                                EXTRACT(MONTH FROM START_DATE) = 11
                            OR
                                EXTRACT(MONTH FROM END_DATE) = 11
                            OR
                                (EXTRACT(MONTH FROM START_DATE) < 11
                            AND
                                TO_CHAR(END_DATE, 'YYYY-MM') > '2022-11')
                            )
            )
        ) 
    )
WHERE FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC;