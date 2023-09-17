/* 코드를 입력하세요 */
SELECT *
    FROM (
    SELECT DISTINCT 
        CAR_ID, CAR_TYPE,
        ROUND(30 * (DAILY_FEE - (DAILY_FEE * DC_RATE)), 0) AS FEE
    FROM (
        SELECT CAR_ID, CAR_TYPE, DAILY_FEE,
            CASE WHEN CAR_TYPE = 'SUV' THEN (SELECT DISCOUNT_RATE / 100
                                            FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                            WHERE DURATION_TYPE = '30일 이상'
                                            AND CAR_TYPE = 'SUV')
                WHEN CAR_TYPE = '세단' THEN (SELECT DISCOUNT_RATE / 100
                                            FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                            WHERE DURATION_TYPE = '30일 이상'
                                            AND CAR_TYPE = '세단')
                ELSE 0 END AS DC_RATE
        FROM (
            SELECT C.CAR_ID, C.CAR_TYPE, C.DAILY_FEE
            FROM CAR_RENTAL_COMPANY_CAR C JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H
            ON C.CAR_ID = H.CAR_ID
            WHERE C.CAR_TYPE IN ('세단', 'SUV')
            AND C.CAR_ID NOT IN (SELECT CAR_ID
                                FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                                WHERE 
                                    MONTH(START_DATE) = 11
                                OR
                                    MONTH(END_DATE) = 11
                                OR
                                    (MONTH(START_DATE) < 11
                                    AND
                                    DATE_FORMAT(END_DATE, '%Y-%m') > '2022-11')) 
            ) TBL_1
        ) TBL_2
    ) TBL_3
WHERE FEE BETWEEN 500000 AND 2000000
ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC;