def solution(n):
    a = 1 if n%7 != 0 else 0
    answer = n//7+a
    
    return answer