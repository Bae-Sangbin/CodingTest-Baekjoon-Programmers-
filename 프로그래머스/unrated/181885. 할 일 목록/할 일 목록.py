def solution(todo_list, finished):
    answer = []
    t = [idx for idx in range(len(finished))]
    for i in t:
        if not finished[i]:
            answer.append(todo_list[i])
    return answer