from math import sqrt
def solution(n):
    a = 0
    for _ in range(10000000):
        if a == sqrt(n):
            return (a+1) ** 2
        else:
            a += 1
            continue
    return -1