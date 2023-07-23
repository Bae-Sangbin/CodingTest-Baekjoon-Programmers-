def solution(num_list, n):
    answer = []
    for i in range(1, len(num_list)+1):
        if i < n:
            continue
        else :
            answer.append(num_list[i-1])
    return answer