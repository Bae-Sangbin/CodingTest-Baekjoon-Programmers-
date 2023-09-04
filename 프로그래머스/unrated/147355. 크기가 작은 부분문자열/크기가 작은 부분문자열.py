def solution(t, p):
    answer = 0
    result = ''
    i = 0
    while i+len(p)<=len(t):
        result = t[i:i+len(p)]
        i += 1
        if int(result) <= int(p):
            answer += 1
    return answer