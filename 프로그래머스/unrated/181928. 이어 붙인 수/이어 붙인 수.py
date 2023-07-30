def solution(num_list):
    answer = 0
    odd = ''
    even = ''
    for i in num_list:
        if i % 2:
            i = str(i)
            odd += i
        else:
            i = str(i)
            even += i
    answer = int(odd) + int(even)
    return answer