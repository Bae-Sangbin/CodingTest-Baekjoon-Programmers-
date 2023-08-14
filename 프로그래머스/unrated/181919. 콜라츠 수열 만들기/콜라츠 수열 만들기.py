def solution(n):
    answer = []
    if n % 2 == 1:
        answer.append(n)
        n = 3*n+1
    while n % 2 == 0:
        answer.append(n)
        n /= 2
        if n == 1:
            answer.append(n)
            break
        elif n % 2 == 0:
            continue
        else:
            answer.append(n)
            n = 3*n+1
    

    return answer