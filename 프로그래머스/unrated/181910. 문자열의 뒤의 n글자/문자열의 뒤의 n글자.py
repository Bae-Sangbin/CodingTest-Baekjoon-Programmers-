def solution(my_string, n):
    answer = ''
    for i in range(len(my_string), len(my_string)-n, -1):
        answer = my_string[i-1] + answer
    return answer