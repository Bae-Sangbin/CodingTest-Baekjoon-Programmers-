def solution(array):
    answer = []
    max_value = array[0]
    max_index = 0
    
    for i in range(1, len(array)):
        if max_value < array[i]:
            max_value = array[i]
            max_index = i
    
    answer.append(max_value)
    answer.append(max_index)
    return answer
