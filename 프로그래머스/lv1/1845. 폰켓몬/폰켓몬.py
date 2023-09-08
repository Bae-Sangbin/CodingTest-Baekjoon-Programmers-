def solution(nums):
    species = len(set(nums)) 
    can_take = len(nums) // 2
    return can_take if species > can_take else species