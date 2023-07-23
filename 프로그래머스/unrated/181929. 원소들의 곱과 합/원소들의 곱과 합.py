def solution(num_list):
    answer = 0
    sum = 0
    mul = 1
    for i in num_list:
        sum += i
    sum = sum ** 2
    for j in num_list:
        mul *= j
    answer = 1 if sum > mul else 0
    return answer