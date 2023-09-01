def solution(x):
    result = 0
    answer = True
    int_x = x
    x = str(x)
    for i in x:
        result += int(i)
    if int_x % result:
        answer = False
    return answer
