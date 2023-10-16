SELECT *
FROM (
    SELECT DISTINCT
        TBL_2.CAR_ID,
        TBL_2.CAR_TYPE,
        30 * ROUND(TBL_2.DAILY_FEE - (TBL_2.DAILY_FEE * TBL_2.DC_RATE)) AS FEE
    FROM (
        SELECT 
            TBL_1.CAR_ID,
            TBL_1.CAR_TYPE,
            TBL_1.DAILY_FEE,
            TBL_1.HISTORY_ID,
            (
                SELECT DISCOUNT_RATE/100
                FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                WHERE CAR_RENTAL_COMPANY_DISCOUNT_PLAN.CAR_TYPE = TBL_1.CAR_TYPE
                AND DURATION_TYPE = '30일 이상'
            ) AS DC_RATE
        FROM (
            SELECT 
                A.CAR_ID,
                A.CAR_TYPE,
                A.DAILY_FEE,
                B.HISTORY_ID
            FROM CAR_RENTAL_COMPANY_CAR A 
            JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B ON A.CAR_ID = B.CAR_ID
            WHERE A.CAR_ID NOT IN (
                SELECT CAR_ID
                FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                WHERE (
                    (EXTRACT(MONTH FROM START_DATE) <= 10 AND EXTRACT(YEAR FROM END_DATE) > 2022)
                    OR (EXTRACT(MONTH FROM START_DATE) <= 10 AND EXTRACT(MONTH FROM END_DATE) >= 11)
                    OR (EXTRACT(MONTH FROM START_DATE) = 11 AND EXTRACT(MONTH FROM END_DATE) = 11)
                )
            )
            AND A.CAR_TYPE IN ('SUV', '세단')
        ) TBL_1
    ) TBL_2
) TBL_3
WHERE FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, CAR_TYPE, CAR_ID DESC;