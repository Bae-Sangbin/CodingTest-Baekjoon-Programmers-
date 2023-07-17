def solution(money):
    answer = []
    count = 0
    count += money // 5500
    money %= 5500
    answer = [count, money]
    return answer