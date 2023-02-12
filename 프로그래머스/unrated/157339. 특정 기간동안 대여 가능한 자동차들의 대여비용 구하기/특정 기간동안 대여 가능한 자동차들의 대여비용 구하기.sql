#CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서 
#자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고
#30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 
#자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성해주세요. 
#결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬해주세요.

#풀이 과정

# WITH TBL_1 AS
# (SELECT *
# FROM (SELECT *
#       FROM CAR_RENTAL_COMPANY_CAR
#       WHERE CAR_TYPE IN ('SUV', '세단')) A
# WHERE A.CAR_ID NOT IN (
# SELECT DISTINCT CAR_ID
# FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
# WHERE MONTH(END_DATE) = 11
# OR (MONTH(START_DATE) < 11 AND DATE_FORMAT(END_DATE,'%Y-%m') >= '2022-11'))),

# 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능한 자동차들을 추려내는 작업

# TBL_2 AS
# (SELECT *,
#     CASE WHEN CAR_TYPE = '세단' THEN (SELECT DISCOUNT_RATE/100
#                                      FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
#                                      WHERE CAR_TYPE = "세단"
#                                      AND DURATION_TYPE = "30일 이상") 
#          WHEN CAR_TYPE = 'SUV' THEN (SELECT DISCOUNT_RATE/100
#                                      FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
#                                      WHERE CAR_TYPE = "SUV"
#                                      AND DURATION_TYPE = "30일 이상") 
#     END AS 'DC_RATE'
# FROM TBL_1),

# 조건에 맞는 자동차들에 대한 대여 기록 정보를 TBL_1으로 만들었고,
# FROM 절을 TBL_1으로 하는 TBL_2를 만듭니다.
# TBL_2에서는 CAR_TYPE에 따라서 30일 이상의 할인율이 다르기 때문에
# 할인정보에 대한 정보가 있는 CAR_RENTAL_COMPANY_DISCOUNT_PLAN에 접근해서 
# 할인율을 각각의 자동차에 

WITH TBL_1 AS
(SELECT *
FROM (SELECT *
      FROM CAR_RENTAL_COMPANY_CAR
      WHERE CAR_TYPE IN ('SUV', '세단')) A
WHERE A.CAR_ID NOT IN (
SELECT CAR_ID
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE MONTH(END_DATE) = 11
OR (MONTH(START_DATE) < 11 AND DATE_FORMAT(END_DATE,'%Y-%m') >= '2022-11'))),
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
(SELECT
    CAR_ID, 
    CAR_TYPE,
    30 * (ROUND(DAILY_FEE - (DAILY_FEE * DC_RATE),0)) AS FEE
FROM TBL_2)

SELECT *
FROM TBL_3
WHERE FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, CAR_TYPE, CAR_ID DESC;