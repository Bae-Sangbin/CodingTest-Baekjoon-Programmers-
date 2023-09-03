def solution(d, budget):
    result = []
    answer = 0
    sum = 0
    d.sort()
    for i in range(len(d)):
        sum += d[i]
        result.append(d[i])
        if sum == budget:
            break
        elif sum > budget:
            result.pop()
    print(result)
    return len(result)