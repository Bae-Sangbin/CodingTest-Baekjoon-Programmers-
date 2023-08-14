def solution(x1, x2, x3, x4):
    answer = True
    if x1 == 0 and x2 == 0:
        x12 = False
    else:
        x12 = True
    if x3 == 0 and x4 == 0:
        x34 = False
    else:
        x34 = True
    if x12 == 1 and x34 == 1:
        answer = True
    else:
        answer = False
    return answer