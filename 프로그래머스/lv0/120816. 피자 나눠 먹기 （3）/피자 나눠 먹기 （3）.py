def solution(slice, n):
    a = 1 if n%slice != 0 else 0
    answer = n // slice + a
    return answer