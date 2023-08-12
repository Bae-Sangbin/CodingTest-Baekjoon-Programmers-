def solution(numlist, n):
    p_arr = [[abs(n-num), -num] for num in numlist]
    p_arr = sorted(p_arr)
    
    return [-num for far, num in p_arr]