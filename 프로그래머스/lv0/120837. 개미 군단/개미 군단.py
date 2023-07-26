def solution(hp):
    answer = 0
    while hp >= 5:
        answer += 1
        hp -= 5
    while hp >= 3:
        answer += 1
        hp -= 3
    while hp != 0:
        answer += 1
        hp -= 1
    return answer