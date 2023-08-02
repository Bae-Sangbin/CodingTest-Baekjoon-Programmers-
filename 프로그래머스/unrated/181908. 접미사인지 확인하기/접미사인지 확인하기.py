def solution(my_string, is_suffix):
    answer = 0
    answer = 1 if my_string.endswith(is_suffix) else 0

    return answer