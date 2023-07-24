def solution(emergency):
    answer = []
    pset = sorted(emergency)
    pset.reverse()
    for i in emergency:
        answer.append(pset.index(i) + 1)
    return answer