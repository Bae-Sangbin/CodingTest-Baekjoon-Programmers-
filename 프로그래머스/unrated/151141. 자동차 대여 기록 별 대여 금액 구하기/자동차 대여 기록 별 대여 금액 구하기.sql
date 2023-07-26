-- 코드를 입력하세요
SELECT
    HISTORY_ID,
    ROUND(RENTAL_PERIOD * DISCOUNT_FEE, 0) AS FEE
FROM (
    SELECT
        HISTORY_ID,
        DAILY_FEE - (DAILY_FEE * (DC_RATE / 100)) AS DISCOUNT_FEE,
        RENTAL_PERIOD
    FROM (
        SELECT
            HISTORY_ID,
            DAILY_FEE,
            RENTAL_PERIOD,
            CASE
                WHEN 구분 = '90일 이상' THEN (SELECT DISCOUNT_RATE
                                            FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                            WHERE CAR_TYPE = '트럭'
                                              AND DURATION_TYPE = '90일 이상')
                WHEN 구분 = '30일 이상' THEN (SELECT DISCOUNT_RATE
                                            FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                            WHERE CAR_TYPE = '트럭'
                                              AND DURATION_TYPE = '30일 이상')
                WHEN 구분 = '7일 이상' THEN (SELECT DISCOUNT_RATE
                                           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                           WHERE CAR_TYPE = '트럭'
                                             AND DURATION_TYPE = '7일 이상')
                ELSE 0.00
            END AS DC_RATE
        FROM (
            SELECT
                HISTORY_ID,
                DAILY_FEE,
                RENTAL_PERIOD,
                CASE
                    WHEN RENTAL_PERIOD >= 90 THEN '90일 이상'
                    WHEN RENTAL_PERIOD >= 30 THEN '30일 이상'
                    WHEN RENTAL_PERIOD >= 7 THEN '7일 이상'
                    ELSE '7일 미만'
                END AS 구분
            FROM (
                SELECT
                    A.CAR_ID,
                    DAILY_FEE,
                    HISTORY_ID,
                    START_DATE,
                    END_DATE,
                    ROUND(TRUNC(END_DATE) - TRUNC(START_DATE)) + 1 AS RENTAL_PERIOD
                FROM
                    CAR_RENTAL_COMPANY_CAR A
                    JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B ON A.CAR_ID = B.CAR_ID
                WHERE
                    CAR_TYPE = '트럭'
            ) TBL_1
        ) TBL_2
    ) TBL_3
) TBL_4
ORDER BY
    FEE DESC,
    HISTORY_ID DESC;