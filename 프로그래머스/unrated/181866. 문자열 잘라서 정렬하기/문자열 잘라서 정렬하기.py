def solution(myString):
    answer = []
    result = myString.split('x')
    for i in result:
        if not i == "":
            answer.append(i)
    answer = sorted(answer)
    return answer