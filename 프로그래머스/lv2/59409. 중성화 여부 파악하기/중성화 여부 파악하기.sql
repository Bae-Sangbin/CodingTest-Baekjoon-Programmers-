SELECT ANIMAL_ID, NAME, IF(SEX_UPON_INTAKE LIKE '%Neutered%' or 
                           SEX_UPON_INTAKE LIKE '%Spayed%','O','X') 
                           AS '중성화여부'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;