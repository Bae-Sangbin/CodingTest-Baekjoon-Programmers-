def solution(my_string, num1, num2):
    l_string = list(my_string)
    l_string[num1], l_string[num2] = l_string[num2], l_string[num1]
    return ''.join(l_string)