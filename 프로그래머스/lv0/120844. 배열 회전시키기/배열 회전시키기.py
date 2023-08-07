from collections import deque


def solution(numbers, direction):
    if direction == 'right':
        numbers = deque(numbers)
        numbers.rotate(1)
    else :
        numbers = deque(numbers)
        numbers.rotate(-1)
    return list(numbers)