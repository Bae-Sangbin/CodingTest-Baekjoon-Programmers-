def solution(my_string):
    answer = []
    my_string = list(my_string)
    for i in range(len(my_string)):
        temp = ''.join(my_string)
        my_string = my_string[1:]
        answer.append(temp)
    return sorted(answer)