def solution(arr):
    answer = []
    for i in range(len(arr)):
        if arr[i] == 2:
            break
    for j in reversed(range(len(arr))):
        if arr[j] == 2:
            break
    if i == j:
        answer.append(2)
    elif i > j:
        answer.append(-1)
    else :  
        for k in range(i, j+1):
            answer.append(arr[k])
    print(i, j)
    return answer