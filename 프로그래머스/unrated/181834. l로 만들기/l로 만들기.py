def solution(myString):
    answer = ''
    for s in myString:
        if s < 'l' :
            s = 'l'
            answer = answer + s
        else :
            answer = answer + s
    return answer