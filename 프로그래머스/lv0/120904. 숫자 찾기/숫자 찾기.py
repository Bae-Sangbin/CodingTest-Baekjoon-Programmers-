def solution(num, k):
    count = 0
    for i in str(num):
        count += 1
        if i == str(k):
            answer = count
            break
        else :
            answer = -1
        
    return answer