from itertools import combinations
def is_prime(x):
    for i in range(2, int(x**(1/2))+1):
        if x % i == 0:
            return False
    return True

def solution(nums):
    answer = 0
    for x in combinations(nums, 3):
        if is_prime(sum(x)):
            answer += 1

    return answer