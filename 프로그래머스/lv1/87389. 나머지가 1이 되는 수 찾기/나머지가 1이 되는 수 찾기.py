def solution(n):
    x = 1
    for i in range(n):
        if n % x == 1:
            break
        x+=1
    return x