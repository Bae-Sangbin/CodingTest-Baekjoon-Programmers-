def solution(my_string, m, c):
    answer = ''
    for i in my_string[c-1::m]:
        answer += i
    return answer