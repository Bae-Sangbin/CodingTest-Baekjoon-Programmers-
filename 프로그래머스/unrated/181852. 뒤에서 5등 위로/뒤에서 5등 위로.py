from collections import deque
queue = deque()
def solution(num_list):
    queue = []
    num_list.sort(reverse = True)
    for i in num_list:
        queue.append(i)
    queue.pop()
    queue.pop()
    queue.pop()
    queue.pop()
    queue.pop()
    queue.sort()
    return queue