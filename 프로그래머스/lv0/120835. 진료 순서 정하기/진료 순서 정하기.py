def solution(emergency):
    answer = []
    pset = sorted(emergency)
    pset.reverse()
    for i in emergency:
        answer.append(pset.index(i) + 1)
    return answer

# 참고자료 : https://gomming.tistory.com/28