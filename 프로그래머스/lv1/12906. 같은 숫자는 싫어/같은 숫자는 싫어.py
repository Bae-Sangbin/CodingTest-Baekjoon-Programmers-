def solution(arr):
    answer = [arr[0]]
    for idx in range(len(arr)):
        if arr[idx] == answer[-1]:
            pass
        else:
            answer.append(arr[idx])
        
    return answer