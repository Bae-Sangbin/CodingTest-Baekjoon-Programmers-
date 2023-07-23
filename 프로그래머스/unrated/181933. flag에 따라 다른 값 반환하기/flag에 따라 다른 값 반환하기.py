def solution(a, b, flag):
    answer = 0
    answer = a+b if flag == bool(1) else a-b
    return answer