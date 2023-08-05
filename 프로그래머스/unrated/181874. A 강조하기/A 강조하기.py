def solution(myString):
    answer = ''
    for s in myString:
        if s == 'a':
            answer = answer + 'A'
        elif s == 'A':
            answer = answer + 'A'
        else:
            answer = answer + s.lower()
    return answer