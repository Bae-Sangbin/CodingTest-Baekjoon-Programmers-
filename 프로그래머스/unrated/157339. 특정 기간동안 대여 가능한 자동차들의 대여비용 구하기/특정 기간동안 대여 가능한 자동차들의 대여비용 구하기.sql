# 실패한 쿼리(2)

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
where A.car_id not in (
        select distinct car_id
        from CAR_RENTAL_COMPANY_RENTAL_HISTORY as B
        where ('2022-11-01' between start_date and end_date) 
        or ('2022-11-30' between start_date and end_date))
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
FROM TBL_1)

SELECT DISTINCT
    CAR_ID,
    CAR_TYPE,
    30 * (ROUND(DAILY_FEE - (DAILY_FEE * DC_RATE),0)) AS FEE
FROM TBL_2
WHERE (30 * (ROUND(DAILY_FEE - (DAILY_FEE * DC_RATE),0)) >= 500000)
AND (30 * (ROUND(DAILY_FEE - (DAILY_FEE * DC_RATE),0)) < 2000000)
ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC;

# SELECT 
#     A.CAR_ID,
#     CAR_TYPE,
#     DAILY_FEE,
#     HISTORY_ID,
#     DATE_FORMAT(START_DATE,'%Y-%m-%d') AS START_DATE,
#     DATE_FORMAT(END_DATE,'%Y-%m-%d') AS END_DATE
# FROM CAR_RENTAL_COMPANY_CAR A LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B 
# ON A.CAR_ID = B.CAR_ID
# where A.car_id not in (
#         select distinct car_id
#         from CAR_RENTAL_COMPANY_RENTAL_HISTORY as B
#         where ('2022-11-01' between start_date and end_date) 
#         or ('2022-11-30' between start_date and end_date))
# AND CAR_TYPE IN ('SUV', '세단')