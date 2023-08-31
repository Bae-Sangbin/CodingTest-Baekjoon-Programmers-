def solution(n):
    answer = 0
    N = list(str(n))  # Convert the integer 'n' to a list of its digits as strings
    
    for i in N:
        answer += int(i)

    return answer