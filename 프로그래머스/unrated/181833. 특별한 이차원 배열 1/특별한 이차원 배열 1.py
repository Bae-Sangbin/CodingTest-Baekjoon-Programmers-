def solution(n):
    answer = [[0] * n for _ in range(n)]  # 2차원 리스트 초기화
    for i in range(1,n+1):
        for j in range(1,n+1):
            if i == j:
                answer[i-1][j-1] = 1
            else :
                answer[i-1][j-1] = 0
    return answer