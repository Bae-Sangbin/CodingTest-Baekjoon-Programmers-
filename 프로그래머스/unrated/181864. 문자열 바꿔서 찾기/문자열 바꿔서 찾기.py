def solution(myString, pat):
    myString = myString.replace('A', 'X').replace('B', 'A').replace('X', 'B')
    if pat in myString:
        answer = 1
    else:
        answer = 0
    return answer