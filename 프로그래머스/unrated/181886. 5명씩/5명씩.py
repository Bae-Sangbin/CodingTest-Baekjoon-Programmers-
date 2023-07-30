def solution(names):
    answer = []
    r = [5*i for i in range(len(names)//5+1)] if len(names) % 5 != 0 else [5*i for i in range(len(names)//5)]
    for i in r:
        answer.append(names[i])
    return answer