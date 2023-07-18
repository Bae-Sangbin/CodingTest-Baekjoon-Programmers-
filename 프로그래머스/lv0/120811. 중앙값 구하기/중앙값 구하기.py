def solution(array):
    array.sort()
    answer = 0
    for i in range((len(array)//2)+1):
        answer = array[i]
    return answer