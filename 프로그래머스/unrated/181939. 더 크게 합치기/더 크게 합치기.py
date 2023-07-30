def solution(a, b):
    answer = 0
    a = str(a)
    b = str(b)
    result1 = a+b
    result2 = b+a
    answer = int(result1) if int(result1) >= int(result2) else int(result2)
    return answer