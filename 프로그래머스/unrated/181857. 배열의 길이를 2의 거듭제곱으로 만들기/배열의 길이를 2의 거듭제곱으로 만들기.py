def solution(arr):
    target_length = 1
    while target_length < len(arr):
        target_length *= 2
        
    while len(arr) < target_length:
        arr.append(0)
        
    return arr