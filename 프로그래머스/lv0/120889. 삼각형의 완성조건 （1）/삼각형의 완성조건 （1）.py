def solution(sides):
    answer = []
    sides.sort(reverse=True)
    for i in sides:
        answer.append(i)
    answer = 1 if answer[0] < answer[1] + answer[2] else 2
    return answer