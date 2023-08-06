def solution(num_list, n):
    answer = []
    answer1 = num_list[:n]
    answer = num_list[n:]
    for i in answer1:
        answer.append(i)
    return answer