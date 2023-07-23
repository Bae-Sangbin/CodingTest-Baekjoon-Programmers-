def solution(n):
    answer = 1
    while n > answer :
        answer += 1
        n = n // answer
    return answer
        