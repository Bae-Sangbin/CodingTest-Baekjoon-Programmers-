def solution(num_list):
    answer = []
    for i in num_list:
        answer.append(i)
    if num_list[-1] > num_list[-2]:
        answer.append(num_list[-1] - num_list[-2])
    else:
        answer.append(num_list[-1] * 2)
    return answer