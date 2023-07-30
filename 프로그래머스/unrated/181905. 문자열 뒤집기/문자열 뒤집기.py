def solution(my_string, s, e):
    answer = ''
    answer = my_string[:s]
    for i in range(e,s-1,-1):
        answer = answer + my_string[i]
    answer = answer + my_string[e+1:]
    return answer