def solution(myString):
    answer = []
    result = myString.split('x')
    for ans in result:
        answer.append(len(ans))
    return answer