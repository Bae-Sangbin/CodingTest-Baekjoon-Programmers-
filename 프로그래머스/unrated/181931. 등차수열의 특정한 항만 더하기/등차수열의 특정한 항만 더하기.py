def solution(a, d, included):
    answer = 0
    for i in range(len(included)):
        if not included[i]:
            a += d
        else:
            answer += a
            a += d
    return answer