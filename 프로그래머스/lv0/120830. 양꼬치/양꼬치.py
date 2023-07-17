def solution(n, k):
    sale = n // 10
    answer = 12000*n + 2000*(k-sale)
    return answer