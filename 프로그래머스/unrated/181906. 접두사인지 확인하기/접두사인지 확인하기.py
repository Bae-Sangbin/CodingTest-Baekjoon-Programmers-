def solution(my_string, is_prefix):
    answer = 0
    answer = 1 if my_string.startswith(is_prefix) else 0
    return answer