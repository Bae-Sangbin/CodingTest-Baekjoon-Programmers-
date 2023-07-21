def solution(price):
    if price >= 500000:
        answer = price - price * 0.20
    elif price >= 300000:
        answer = price - price * 0.10
    elif price >= 100000:
        answer = price - price * 0.05
    else :
        answer = price
    return int(answer)