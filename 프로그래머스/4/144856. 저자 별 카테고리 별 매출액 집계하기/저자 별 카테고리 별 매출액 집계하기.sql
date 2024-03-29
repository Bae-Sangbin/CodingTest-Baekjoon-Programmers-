SELECT A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(TOTAL_SALES) AS TOTAL_SALES
FROM AUTHOR A, (
    SELECT B.AUTHOR_ID, B.CATEGORY, B.PRICE*BS.SALES AS TOTAL_SALES
    FROM BOOK_SALES BS, BOOK B
    WHERE BS.BOOK_ID = B.BOOK_ID
    AND TO_CHAR(BS.SALES_DATE, 'YYYY-MM') = '2022-01'
) B
WHERE A.AUTHOR_ID = B.AUTHOR_ID
GROUP BY A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY
ORDER BY A.AUTHOR_ID, B.CATEGORY DESC;