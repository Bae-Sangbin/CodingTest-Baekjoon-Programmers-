# DESC JULY
# FIRST_HALF
# PK : FLAVOR 

# JULY
# PK : SHIPMENT_ID
# MUL(다중값) : FK 후보군 중에 하나이다. : FLAVOR 
# 1대다 관계가 됩니다. 다 쪽에 있는 키가 외래키, 1 쪽에 있는 키가 기본키가 됩니다.


# SELECT J.FLAVOR
# FROM FIRST_HALF F JOIN JULY J ON F.SHIPMENT_ID = J.SHIPMENT_ID
# GROUP BY J.FLAVOR
# ORDER BY F.TOTAL_ORDER + SUM(J.TOTAL_ORDER) DESC
# LIMIT 3

# SELECT F_HALF.FLAVOR
# FROM FIRST_HALF F_HALF JOIN 
# (SELECT 
#     DISTINCT FLAVOR, 
#     SUM(TOTAL_ORDER) OVER(PARTITION BY FLAVOR) AS SUM_ORDER
# FROM JULY) JULY_SUM
# ON F_HALF.FLAVOR = JULY_SUM.FLAVOR
# ORDER BY (F_HALF.TOTAL_ORDER + JULY_SUM.SUM_ORDER) DESC LIMIT 3

select j.flavor
from
(SELECT flavor, sum(total_order) as total
from july 
group by flavor) j join
(SELECT flavor, sum(total_order) as total
from FIRST_HALF 
group by flavor) fh on j.flavor = fh.flavor
order by fh.TOTAL + j.TOTAL DESC limit 3
