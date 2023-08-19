def solution(arr, queries):
    answer = []
    result = []
    for s,e,k in queries:
        for i in range(s, e+1):
            if arr[i] > k:
                result.append(arr[i])
            else:
                continue
        if not result == []:
            answer.append(min(result))
        else: 
            answer.append(-1)
        result = []
    return answer