def solution(price, money, count):
    answer = -1
    prices = 0
    for i in range(1,count+1):
        prices += price * i
    if money > prices:
        return 0
    else:
        return abs(money-prices)