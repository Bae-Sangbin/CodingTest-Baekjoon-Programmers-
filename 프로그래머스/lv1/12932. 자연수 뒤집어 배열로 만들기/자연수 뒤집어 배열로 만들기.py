def solution(n):
    answer = []
    N = list(str(n))
    for i in reversed(N):
        answer.append(int(i))
    return answer