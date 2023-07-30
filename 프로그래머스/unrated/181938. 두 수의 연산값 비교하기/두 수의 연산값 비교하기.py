def solution(a, b):
    answer = 0
    result2 = 2 * a * b 
    a = str(a)
    b = str(b)
    result1 = a+b
    answer = int(result1) if int(result1) >= result2 else result2
    
    return answer