from math import sqrt

def solution(n):
    answer = 1 if sqrt(n) % 1 == 0 else 2 
    return answer
