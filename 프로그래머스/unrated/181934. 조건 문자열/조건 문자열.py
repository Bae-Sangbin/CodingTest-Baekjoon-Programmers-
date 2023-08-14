def solution(ineq, eq, n, m):
    answer = 0
    if n == m :
        answer = 1 if (eq == "=") else 0 
    elif n < m :
        answer = 1 if (ineq == "<") else 0 
    else :
        answer = 1 if (ineq == ">") else 0 
    return answer