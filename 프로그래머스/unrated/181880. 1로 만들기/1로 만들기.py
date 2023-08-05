def solution(num_list):
    answer = 0
    for i in num_list:
        while i != 1:
            if not i % 2:
                i /= 2
                answer += 1
            elif i % 2:
                i -= 1
                i /= 2
                answer += 1
    return answer