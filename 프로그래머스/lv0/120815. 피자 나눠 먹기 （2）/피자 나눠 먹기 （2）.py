
def solution(n):
    result = 1
    while (n * result) % 6 != 0:
         result += 1
    answer = n * result // 6     
    return answer