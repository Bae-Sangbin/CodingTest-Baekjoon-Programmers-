-- SELECT 	필요한 속성만 추출 -> 속성명(컬럼명)
-- FROM 	어떤 테이블에서? -> 테이블명
-- WHERE 	조건에 맞는 데이터만 추출 -> 조건
-- ORDER BY 정렬 기준(ASC, DESC)
SELECT ANIMAL_ID
FROM ANIMAL_INS
Where NAME IS NOT NULL
ORDER BY ANIMAL_ID ASC