def solution(num_list, n):
    answer = []
    for i in range(1,n+1):
        answer.append(num_list[i-1])
    return answer