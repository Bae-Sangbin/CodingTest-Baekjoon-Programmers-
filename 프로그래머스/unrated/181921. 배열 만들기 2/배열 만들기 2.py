def solution(l, r):
    answer = []
    for i in range(l, r + 1):
        if all(digit in ['0', '5'] for digit in str(i)):
            answer.append(i)
    
    if not answer:
        return [-1]
    
    return answer

# 테스트
print(solution(5, 555))  # [5, 50, 55, 500, 505, 550, 555]



