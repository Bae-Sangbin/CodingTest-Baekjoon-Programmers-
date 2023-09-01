def solution(n):
    answer = []
    result = ''
    N = list(str(n))
    for i in N:
        answer.append(int(i))
        answer.sort(reverse = True)
    for j in answer:
        result += str(j)
    return int(result)