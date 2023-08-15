def solution(arr, queries):
    answer = []
    temp = 0
    for i,j in queries:
        temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
    return arr