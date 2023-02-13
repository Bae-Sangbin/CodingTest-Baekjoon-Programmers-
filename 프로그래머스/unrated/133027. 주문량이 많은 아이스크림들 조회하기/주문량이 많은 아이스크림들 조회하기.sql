# DESC JULY
# FIRST_HALF
# PK : FLAVOR 

# JULY
# PK : SHIPMENT_ID
# MUL(다중값) : FK 후보군 중에 하나이다. : FLAVOR 
# 1대다 관계가 됩니다. 다 쪽에 있는 키가 외래키, 1 쪽에 있는 키가 기본키가 됩니다.


select j.flavor
from
(SELECT flavor, sum(total_order) as total
from july 
group by flavor) j join
(SELECT flavor, sum(total_order) as total
from FIRST_HALF 
group by flavor) fh on j.flavor = fh.flavor
order by fh.TOTAL + j.TOTAL DESC limit 3