def solution(my_string):
    answer = ''
    for i in range(len(my_string)):
        if my_string[i].islower():
            answer = answer + my_string[i].upper()
        else:
            answer = answer + my_string[i].lower()
    return answer