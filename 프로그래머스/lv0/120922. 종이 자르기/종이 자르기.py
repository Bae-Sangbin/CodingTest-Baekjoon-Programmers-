def solution(M, N):
    answer = 0
    if (M == 1) and (N == 1):
        answer = 0
    elif (M == 1) or (N == 1):
        answer = (M*N) - 1 
    else:
        answer = ((N-1)*M) + (M-1)
    return answer