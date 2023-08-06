def solution(arr):
    answer = []
    count = 0
    for j in arr:
        while count != j:
            answer.append(j)
            count += 1
        count = 0
    return answer