def solution(strlist):
    answer = []
    for i in strlist:
        i.strip('""')
    for i in range(len(strlist)) :
        answer.append(len(strlist[i]))
    return answer