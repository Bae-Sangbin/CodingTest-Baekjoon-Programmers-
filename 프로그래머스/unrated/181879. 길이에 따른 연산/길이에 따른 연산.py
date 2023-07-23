def solution(num_list):
    answer = 0
    mul = 1
    for i in num_list:
        if len(num_list) >= 11:
            answer += i
        else :
            mul *= i
            answer = mul
    return answer