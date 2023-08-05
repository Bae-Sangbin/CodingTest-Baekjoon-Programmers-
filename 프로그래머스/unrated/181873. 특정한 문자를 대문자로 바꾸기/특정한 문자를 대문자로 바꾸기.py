def solution(my_string, alp):
    answer = ''
    for string in my_string:
        if alp == string:
            answer = answer + string.upper()
        else :
            answer = answer + string
    return answer