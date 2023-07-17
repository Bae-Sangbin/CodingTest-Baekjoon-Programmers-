-- 코드를 입력하세요
SELECT NAME, DATETIME
FROM (SELECT
    I.ANIMAL_ID,
    I.NAME,
    I.DATETIME,
    ROW_NUMBER() OVER(ORDER BY I.DATETIME ASC) AS RN
FROM ANIMAL_INS I, ANIMAL_OUTS O
WHERE I.ANIMAL_ID = O.ANIMAL_ID(+)
AND O.ANIMAL_ID IS NULL)
WHERE RN <= 3