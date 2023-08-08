def solution(balls, share):
    answer = 0
    n = balls
    m = share
    def factorial(k):
        if k <= 1 :
            return 1
        return k * factorial(k-1)
    
    return factorial(balls) / (factorial(balls-share) * factorial(share))