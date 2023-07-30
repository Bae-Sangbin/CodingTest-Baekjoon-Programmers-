def solution(arr1, arr2):
    answer = 0
    sum1 = 0
    sum2 = 0
    for i in arr1:
        sum1+=i
    for j in arr2:
        sum2+=j
    if len(arr1) > len(arr2):
        answer = 1
    elif len(arr1) < len(arr2):
        answer = -1
    elif sum1 < sum2:
        answer = -1
    elif sum1 > sum2:
        answer = 1
    else :
        answer = 0
    return answer