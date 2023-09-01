def solution(arr):
    answer = arr
    answer.remove(min(arr))
    if answer == []:
        answer.append(-1)
    return answer