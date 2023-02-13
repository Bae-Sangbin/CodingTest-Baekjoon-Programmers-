SELECT a.AUTHOR_ID, a.AUTHOR_NAME, b.CATEGORY, sum(b.PRICE*bs.SALES) as TOTAL_SALES
from BOOK b join AUTHOR a on b.AUTHOR_ID = a.AUTHOR_ID join BOOK_SALES bs on b.BOOK_ID = bs.BOOK_ID
where date_format(SALES_DATE, "%Y-%m") = "2022-01"
group by AUTHOR_ID, CATEGORY
order by AUTHOR_ID, CATEGORY desc;