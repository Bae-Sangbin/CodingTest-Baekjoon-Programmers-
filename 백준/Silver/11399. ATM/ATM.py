N = int(input())
data = list(map(int, input().split()))
data.sort()

result = 0
lst = list()
for i in range(len(data)):
    sum_value = sum(data[:i+1])  # data의 0부터 i까지의 요소들의 합을 계산
    lst.append(sum_value)  # 계산된 합을 lst에 추가

print(sum(lst))  # lst 출력
