def solution(a, b):
    answer = 0
    sum = 0
    if a < b:
        for i in range(a, b+1):
            sum += i
    elif a == b:
        return a
    else:
        for i in range(b, a+1):
            sum += i
    return sum