# 6. 집계함수와 윈도우 함수 혼용해서 연습하기
-- PRODUCT 테이블과 OFFLINE_SALE 테이블에서 판매월별 상품코드별로 판매량의 합계(컬럼명: TOTAL_AMOUNT)와 (집계함수 사용)
-- 판매월별로 판매량의 합계를 순위 매긴 리스트를 출력하는 SQL문을 작성해주세요. (DENSE_RANK 사용)
-- 결과는 판매월을 기준으로 1차 정렬해주시고, 판매월이 같다면 TOTAL_AMOUNT를 기준으로 내림차순 정렬해주세요. 
# (집계함수와 윈도우 함수를 같이 사용해주세요.) 

SELECT PRODUCT_CODE, SUM(PRICE * SALES_AMOUNT) AS 'SALES'
FROM PRODUCT A JOIN OFFLINE_SALE B ON A.PRODUCT_ID = B.PRODUCT_ID
GROUP BY PRODUCT_CODE
ORDER BY SUM(PRICE * SALES_AMOUNT) DESC, PRODUCT_CODE ASC