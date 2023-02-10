WITH TBL_1 AS(
SELECT 
    A.CAR_ID,
    CAR_TYPE,
    DAILY_FEE,
    HISTORY_ID,
    DATE_FORMAT(START_DATE,'%Y-%m-%d') AS START_DATE,
    DATE_FORMAT(END_DATE,'%Y-%m-%d') AS END_DATE
FROM CAR_RENTAL_COMPANY_CAR A JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B 
ON A.CAR_ID = B.CAR_ID
WHERE A.CAR_ID NOT IN (
        SELECT DISTINCT CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS B
        WHERE ((MONTH(START_DATE) <= 10
AND YEAR(END_DATE) > 2022)) 
OR ((MONTH(START_DATE) <= 10
AND MONTH(END_DATE) >= 11))
OR (MONTH(START_DATE) = 11
AND MONTH(END_DATE) = 11))
AND CAR_TYPE IN ('SUV', '세단')),
TBL_2 AS
(SELECT *,
    CASE WHEN CAR_TYPE = '세단' THEN (SELECT DISCOUNT_RATE/100
                                     FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                     WHERE CAR_TYPE = "세단"
                                     AND DURATION_TYPE = "30일 이상") 
         WHEN CAR_TYPE = 'SUV' THEN (SELECT DISCOUNT_RATE/100
                                     FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                     WHERE CAR_TYPE = "SUV"
                                     AND DURATION_TYPE = "30일 이상") 
    END AS 'DC_RATE'
FROM TBL_1),
TBL_3 AS
(SELECT DISTINCT
    CAR_ID,
    CAR_TYPE,
    30 * (ROUND(DAILY_FEE - (DAILY_FEE * DC_RATE),0)) AS FEE
FROM TBL_2)

SELECT *
FROM TBL_3
WHERE FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, CAR_TYPE, CAR_ID DESC;