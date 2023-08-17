def solution(arr):
    i = 0
    stk = []
    for i in range(len(arr)):
        if stk == []:
            stk.append(arr[i])
            i+=1
        elif stk != []:
            if stk[-1] == arr[i]:
                stk = stk[:-1]
                i += 1
            else:
                stk.append(arr[i])
                i += 1
    if stk == []:
        stk.append(-1)
    return stk