# DESC 테이블명으로 기본키와 외래키를 찾는다.

# CAR_RENTAL_COMPANY_CAR
# PK : CAR_ID
# CAR_RENTAL_COMPANY_RENTAL_HISTORY
# PK : HISTORY_ID
# FK : CAR_ID
# CAR_RENTAL_COMPANY_DISCOUNT_PLAN
# PK : PLAN_ID

# 풀이과정

# 문제 풀이 방식은 서브쿼리입니다.
# FROM절의 서브쿼리(인라인 뷰)가 여러 개 중첩된 형태로 이해하시면 됩니다.

# ⓵ 인라인 뷰 : TBL_1 테이블 만들기
# SELECT 
#     A.CAR_ID, 
#     DAILY_FEE, 
#     HISTORY_ID, 
#     START_DATE, 
#     END_DATE, 
#     DATEDIFF(END_DATE,START_DATE)+1 AS 'RENTAL_PERIOD'
# FROM CAR_RENTAL_COMPANY_CAR A JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B 
#     ON A.CAR_ID = B.CAR_ID
# WHERE CAR_TYPE = "트럭"
#     ) TBL_1 
    
# 인라인 뷰 안에서 CAR_ID를 외래키로 한 두 테이블을 조인한 다음,
# 자동차 종류가 '트럭'인 자동차만을 WHERE 조건으로 FILTERING 작업한 TBL_1 테이블을 만듭니다.
# TBL_1이라는 테이블에서 자동차 대여 기간을 의미하는 'RENTAL_PERIOD'도 만듭니다.

# ⓶ 인라인 뷰 : TBL_2 테이블 만들기

# SELECT HISTORY_ID, DAILY_FEE, RENTAL_PERIOD,
#     CASE WHEN RENTAL_PERIOD >= 90 THEN '90일 이상'
#          WHEN RENTAL_PERIOD >= 30 THEN '30일 이상'
#          WHEN RENTAL_PERIOD >=  7 THEN  '7일 이상'
#     ELSE '7일 미만' END AS '구분'
# FROM TBL_1

# TBL_1 테이블을 FROM절로 사용하는 TBL_2 테이블을 만듭니다.
# TBL_2에서는 TBL_1에서 파생적으로 만든 'RENTAL_PERIOD'에 따라서 
# '90일 이상', '30일 이상', '7일 이상', '7일 미만'으로 구분짓습니다.
# 이 작업을 하는 이유는 같은 CAR_TYPE이라도 기간의 구간대별로 대여할인율이 달라집니다.

# ⓷ 인라인 뷰 : TBL_3 테이블 만들기

# SELECT 
#     HISTORY_ID, 
#     DAILY_FEE, 
#     RENTAL_PERIOD, 
# CASE WHEN 구분 = '90일 이상' 
# THEN (SELECT DISCOUNT_RATE
#       FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
#       WHERE CAR_TYPE = "트럭"
#       AND DURATION_TYPE = "90일 이상")
# WHEN 구분 = '30일 이상' 
# THEN (SELECT DISCOUNT_RATE
#       FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
#       WHERE CAR_TYPE = "트럭"
#       AND DURATION_TYPE = "30일 이상")
# WHEN 구분 = '7일 이상' 
# THEN (SELECT DISCOUNT_RATE
#       FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
#       WHERE CAR_TYPE = "트럭"
#       AND DURATION_TYPE = "7일 이상")
#     ELSE 0.00 END AS 'DC_RATE'
# FROM TBL_2

# TBL_2 테이블을 FROM절로 사용하는 TBL_3 테이블을 만듭니다.
# CAR_RENTAL_COMPANY_DISCOUNT_PLAN라는 데이터베이스에 저장된 정보 중
# 조건(기간의 구간대별로)에 맞게 할인율을 의미하는 'DISCOUNT_RATE'를 서브쿼리를 통해 가져옵니다. 

# ⓸ 인라인 뷰 : TBL_4 테이블 만들기

# SELECT 
#     HISTORY_ID, 
#     DAILY_FEE - (DAILY_FEE * (DC_RATE/100)) AS DISCOUNT_FEE, 
#     RENTAL_PERIOD
# FROM TBL_3

# TBL_3 테이블을 FROM절로 사용하는 TBL_4 테이블을 만듭니다.
# 일일 대여 금액(DAILY_FEE)에 할인 적용해서 할인된 새로운 요금을 각행마다 구합니다.

# ⓹ 메인 쿼리

# SELECT 
#     HISTORY_ID, 
#     ROUND(RENTAL_PERIOD * DISCOUNT_FEE,0) AS FEE
# FROM TBL_4

# TBL_4 테이블을 FROM절로 사용하는 최종 메인쿼리를 작성합니다.
# (대여기간 * 할인된 일일 대여 요금)으로 최종 대여금액(FEE)를 구합니다.

# ⓺ 정렬

# ORDER BY 
#     FEE DESC, HISTORY_ID DESC;
    
# 대여 금액을 기준으로 내림차순 정렬하고, 
# 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬합니다.


-- 최종 완성된 쿼리(버전 1)
 # SELECT 
 #     HISTORY_ID, 
 #     ROUND(RENTAL_PERIOD * DISCOUNT_FEE,0) AS FEE
 # FROM (
 # SELECT 
 #     HISTORY_ID, 
 #     DAILY_FEE - (DAILY_FEE * (DC_RATE/100)) AS DISCOUNT_FEE, 
 #     RENTAL_PERIOD
 # FROM (
 # SELECT 
 #     HISTORY_ID, 
 #     DAILY_FEE, 
 #     RENTAL_PERIOD, 
 #     CASE WHEN PERIOD_TYPE = '90일 이상' 
 #     THEN (SELECT DISCOUNT_RATE
 #           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
 #           WHERE CAR_TYPE = "트럭"
 #           AND DURATION_TYPE = "90일 이상")
 #     WHEN PERIOD_TYPE = '30일 이상' 
 #     THEN (SELECT DISCOUNT_RATE
 #           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
 #           WHERE CAR_TYPE = "트럭"
 #           AND DURATION_TYPE = "30일 이상")
 #     WHEN PERIOD_TYPE = '7일 이상' 
 #     THEN (SELECT DISCOUNT_RATE
 #           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
 #           WHERE CAR_TYPE = "트럭"
 #           AND DURATION_TYPE = "7일 이상")
 #     ELSE 0.00 END AS 'DC_RATE'
 # FROM (
 # SELECT HISTORY_ID, DAILY_FEE, RENTAL_PERIOD,
 #     CASE WHEN RENTAL_PERIOD >= 90 THEN '90일 이상'
 #          WHEN RENTAL_PERIOD >= 30 THEN '30일 이상'
 #          WHEN RENTAL_PERIOD >= 7 THEN '7일 이상'
 #     ELSE '7일 미만' END AS 'PERIOD_TYPE'
 # FROM(
 # SELECT 
 #     A.CAR_ID, 
 #     DAILY_FEE, 
 #     HISTORY_ID, 
 #     START_DATE, 
 #     END_DATE, 
 #     DATEDIFF(END_DATE,START_DATE)+1 AS 'RENTAL_PERIOD'
 # FROM CAR_RENTAL_COMPANY_CAR A JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B 
 #     ON A.CAR_ID = B.CAR_ID
 # WHERE CAR_TYPE = "트럭"
 #     ) TBL_1 ) TBL_2 ) TBL_3 ) TBL_4
 # ORDER BY 
 #     FEE DESC, HISTORY_ID DESC;


#최종 완성된 쿼리(버전 2)
WITH TBL_1 AS(
SELECT 
    A.CAR_ID, 
    DAILY_FEE, 
    HISTORY_ID, 
    START_DATE, 
    END_DATE, 
    DATEDIFF(END_DATE,START_DATE)+1 AS 'RENTAL_PERIOD'
FROM CAR_RENTAL_COMPANY_CAR A JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B 
    ON A.CAR_ID = B.CAR_ID
WHERE CAR_TYPE = "트럭"
    ),
TBL_2 AS (
    SELECT HISTORY_ID, DAILY_FEE, RENTAL_PERIOD,
    CASE WHEN RENTAL_PERIOD >= 90 THEN '90일 이상'
         WHEN RENTAL_PERIOD >= 30 THEN '30일 이상'
         WHEN RENTAL_PERIOD >=  7 THEN  '7일 이상'
    ELSE '7일 미만' END AS 'PERIOD_TYPE'
FROM TBL_1
    ),
TBL_3 AS (
SELECT 
    HISTORY_ID, 
    DAILY_FEE, 
    RENTAL_PERIOD, 
    CASE WHEN PERIOD_TYPE = '90일 이상' 
    THEN (SELECT DISCOUNT_RATE
          FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
          WHERE CAR_TYPE = "트럭"
          AND DURATION_TYPE = "90일 이상")
    WHEN PERIOD_TYPE = '30일 이상' 
    THEN (SELECT DISCOUNT_RATE
          FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
          WHERE CAR_TYPE = "트럭"
          AND DURATION_TYPE = "30일 이상")
    WHEN PERIOD_TYPE = '7일 이상' 
    THEN (SELECT DISCOUNT_RATE
          FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
          WHERE CAR_TYPE = "트럭"
          AND DURATION_TYPE = "7일 이상")
    ELSE 0.00 END AS 'DC_RATE'
FROM TBL_2
    ),
TBL_4 AS (
SELECT 
    HISTORY_ID, 
    DAILY_FEE - (DAILY_FEE * (DC_RATE/100)) AS DISCOUNT_FEE, 
    RENTAL_PERIOD
FROM TBL_3
)

SELECT 
    HISTORY_ID, 
    ROUND(RENTAL_PERIOD * DISCOUNT_FEE,0) AS FEE
FROM TBL_4
ORDER BY FEE DESC, HISTORY_ID DESC;