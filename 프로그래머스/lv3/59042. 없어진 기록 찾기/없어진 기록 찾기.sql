-- 코드를 입력하세요
SELECT O.ANIMAL_ID, O.NAME
FROM ANIMAL_INS I, ANIMAL_OUTS O
WHERE I.ANIMAL_ID(+) = O.ANIMAL_ID
AND I.ANIMAL_ID IS NULL
ORDER BY O.ANIMAL_ID ASC
;

