def solution(array, n):
    answer = 0
    a = [[abs(arr-n), arr] for arr in array]
    a = sorted(a)
    return a[0][1]
