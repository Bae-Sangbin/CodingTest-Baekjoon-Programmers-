def solution(numbers):
    answer = []
    numbers.sort(reverse = True)
    for i in numbers:
        answer.append(i)
    answer = answer[0] * answer[1]
    return answer