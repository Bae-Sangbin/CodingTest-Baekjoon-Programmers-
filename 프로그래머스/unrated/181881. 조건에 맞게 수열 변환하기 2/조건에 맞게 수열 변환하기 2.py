def solution(arr):
    answer = 0
    lst = []
    while arr != lst:
        lst = arr.copy()
        for i in range(len(arr)):
            if arr[i] >= 50 and arr[i] % 2 == 0:
                arr[i] //= 2
            elif arr[i] < 50 and arr[i] % 2 == 1:
                arr[i] *= 2
                arr[i] += 1
        answer += 1
    return answer-1