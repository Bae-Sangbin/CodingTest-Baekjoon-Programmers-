def solution(chicken):
    answer = 0
    while 10 <= chicken:
        order = chicken // 10
        chicken = chicken % 10
        answer += order
        chicken += order
    return answer