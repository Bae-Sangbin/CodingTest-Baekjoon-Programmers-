-- 코드를 입력하세요
SELECT DISTINCT H.CAR_ID
FROM (
    SELECT *
    FROM CAR_RENTAL_COMPANY_CAR
    WHERE CAR_TYPE = '세단'
) C, CAR_RENTAL_COMPANY_RENTAL_HISTORY H
WHERE C.CAR_ID = H.CAR_ID
AND EXTRACT(MONTH FROM H.START_DATE) = 10
ORDER BY H.CAR_ID DESC
;