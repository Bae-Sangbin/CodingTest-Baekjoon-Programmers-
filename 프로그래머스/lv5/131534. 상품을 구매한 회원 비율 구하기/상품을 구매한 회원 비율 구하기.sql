-- 코드를 입력하세요
SELECT 
    EXTRACT(YEAR FROM SALES_DATE) AS YEAR,
    EXTRACT(MONTH FROM SALES_DATE) AS MONTH,
    COUNT(DISTINCT O.USER_ID) AS PUCHASED_USERS,
    ROUND(COUNT(DISTINCT O.USER_ID) / (SELECT COUNT(USER_ID)
                                         FROM USER_INFO
                                         WHERE EXTRACT(YEAR FROM JOINED) = 2021),1) AS PUCHASED_RATIO
FROM USER_INFO U, ONLINE_SALE O
WHERE U.USER_ID = O.USER_ID
AND EXTRACT(YEAR FROM JOINED) = 2021
GROUP BY 
    EXTRACT(YEAR FROM SALES_DATE),
    EXTRACT(MONTH FROM SALES_DATE)
ORDER BY 
    YEAR,
    MONTH