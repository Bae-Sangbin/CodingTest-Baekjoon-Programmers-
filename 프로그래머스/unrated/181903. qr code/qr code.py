def solution(q, r, code):
    answer = ''
    a = []
    for i in range(len(code)):
        a.append(i % q)
    for j in range(len(a)):
        if a[j] == r:
            answer += code[j]
    return answer