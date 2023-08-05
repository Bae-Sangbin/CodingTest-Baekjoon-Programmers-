from collections import Counter
def solution(array, n):
    answer = Counter(array).get(n)
    return answer