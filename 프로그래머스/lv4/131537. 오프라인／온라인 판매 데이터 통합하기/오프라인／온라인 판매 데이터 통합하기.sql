SELECT
    TO_CHAR(SALES_DATE , 'YYYY-MM-DD') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM
    (
        SELECT
            SALES_DATE,
            PRODUCT_ID,
            USER_ID,
            SALES_AMOUNT
        FROM
            ONLINE_SALE
        UNION --합쳐주기
        SELECT
            SALES_DATE,
            PRODUCT_ID,
            null,
            SALES_AMOUNT
        FROM
            OFFLINE_SALE)
WHERE
        TO_CHAR(SALES_DATE , 'YYYY-MM') ='2022-03'
ORDER BY
    SALES_DATE ASC, --판매일
    PRODUCT_ID ASC, --상품아이디
    USER_ID ASC --유저아이디