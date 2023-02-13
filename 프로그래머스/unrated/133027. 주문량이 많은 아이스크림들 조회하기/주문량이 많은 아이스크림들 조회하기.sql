# DESC JULY
# FIRST_HALF
# PK : FLAVOR 

# JULY
# PK : SHIPMENT_ID
# MUL(다중값) : FK 후보군 중에 하나이다. : FLAVOR 
# 1대다 관계가 됩니다. 다 쪽에 있는 키가 외래키, 1 쪽에 있는 키가 기본키가 됩니다.


SELECT F.FLAVOR
FROM first_half F RIGHT JOIN july J 
ON F.flavor = J.flavor -- july테이블이 더 큼
GROUP BY F.flavor
ORDER BY (SUM(F.total_order) + SUM(J.total_order)) DESC
LIMIT 3