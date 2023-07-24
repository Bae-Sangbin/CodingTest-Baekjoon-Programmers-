def solution(num_list):
    answer = 0
    odd_sum = 0
    even_sum = 0
    for i in num_list[::2]:
        even_sum += i
    for i in num_list[1::2]:
        odd_sum += i
    if odd_sum > even_sum :
        answer = odd_sum
    elif odd_sum < even_sum:
        answer = even_sum
    else:
        answer = even_sum
    return answer