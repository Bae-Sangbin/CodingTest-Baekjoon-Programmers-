def solution(number, n, m):
    answer = 0
    answer = 1 if (number % n) == 0 and (number % m) == 0 else 0
    return answer