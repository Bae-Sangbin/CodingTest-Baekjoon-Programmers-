N = int(input())
data = list(map(int, input().split()))
data.sort()

lst = list()
for i in range(len(data)):
    sum_value = sum(data[:i+1])
    lst.append(sum_value)
print(sum(lst))
