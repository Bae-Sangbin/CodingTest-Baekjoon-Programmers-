def solution(n, m):
    result = []
    answer = []
    for i in range(1, max(n, m)+1):
        if (n % i == 0) and (m % i == 0):
            result.append(i)
    answer.append(max(result))
    for i in range(max(n, m), n*m+1):
        if (i % n == 0) and (i % m == 0):
            answer.append(i)
            break
    return answer