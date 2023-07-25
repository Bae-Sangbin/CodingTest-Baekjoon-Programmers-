-- 코드를 입력하세요
SELECT
    HISTORY_ID,
    ROUND(RENTAL_PERIOD * (DAILY_FEE - (DAILY_FEE * DC_RATE)),0) AS FEE
FROM (
    SELECT
        CAR_ID, DAILY_FEE, HISTORY_ID, RENTAL_PERIOD,
        CASE WHEN RENTAL_PERIOD >= 90 THEN (SELECT DISCOUNT_RATE / 100
                                           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                           WHERE CAR_TYPE = '트럭'
                                           AND DURATION_TYPE = '90일 이상')
            WHEN RENTAL_PERIOD >= 30 THEN (SELECT DISCOUNT_RATE / 100
                                           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                           WHERE CAR_TYPE = '트럭'
                                           AND DURATION_TYPE = '30일 이상')
            WHEN RENTAL_PERIOD >= 7 THEN (SELECT DISCOUNT_RATE / 100
                                           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                           WHERE CAR_TYPE = '트럭'
                                           AND DURATION_TYPE = '7일 이상')
        ELSE 0.00 END AS DC_RATE
    FROM (
    SELECT C.CAR_ID, C.DAILY_FEE, H.HISTORY_ID,
        END_DATE - START_DATE + 1 AS RENTAL_PERIOD
    FROM CAR_RENTAL_COMPANY_CAR C, CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    WHERE C.CAR_ID = H.CAR_ID
    AND C.CAR_TYPE = '트럭'
        )
    )
ORDER BY FEE DESC, HISTORY_ID DESC;