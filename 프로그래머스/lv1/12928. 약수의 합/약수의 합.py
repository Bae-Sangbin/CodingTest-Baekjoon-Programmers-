def solution(n):
    answer = 0
    for x in range(1,n+1):
        if not n % x:
            answer += x
    return answer