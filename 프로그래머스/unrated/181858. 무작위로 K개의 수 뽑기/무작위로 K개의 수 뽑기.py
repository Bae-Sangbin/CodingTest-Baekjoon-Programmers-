def solution(arr, k):
    answer = []
    seen = set()
    
    for num in arr:
        if num not in seen:
            answer.append(num)
            seen.add(num)
            
            if len(answer) == k:
                break
    if len(answer) < k:
        answer += [-1] * (k - len(answer))
    return answer