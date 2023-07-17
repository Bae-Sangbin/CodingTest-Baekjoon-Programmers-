def solution(array, height):
    answer = []
    array.sort()
    count = 0
    for i in array:
        if i <= height :
            continue
        else :
            count+=1
    answer = count
    return answer