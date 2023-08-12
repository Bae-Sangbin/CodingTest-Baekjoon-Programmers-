def solution(my_str, n):
    if len(my_str) % n == 0:
        answer = [my_str[n*idx:n*(idx+1)] for idx in range((len(my_str)//n))]
    else :
        answer = [my_str[n*idx:n*(idx+1)] for idx in range((len(my_str)//n)+1)]
    return answer