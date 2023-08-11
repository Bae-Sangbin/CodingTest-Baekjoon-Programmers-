def solution(numbers, k):
    answer = []
    numbers = k * numbers
    for idx in numbers[::2]:
        answer.append(idx)
    answer = answer[k-1]
    return answer