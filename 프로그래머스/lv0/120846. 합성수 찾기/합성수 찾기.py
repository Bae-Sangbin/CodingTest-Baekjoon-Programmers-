def solution(n):
    answer = 0
    for num in range(2, n+1):
        for div in range(2, num):
            if not num % div:
                answer += 1
                break
    return answer