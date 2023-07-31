def solution(n):
    answer = 0
    if n % 2 :
        odd = [x for x in range(1,n+1,2)]
        for i in odd:
            answer += i
    if not n % 2 :
        even = [x**2 for x in range(0,n+1,2)]
        for i in even:
            answer += i
    
    return answer