N = int(input())
data = list(map(int, input().split()))
a = int(input())
count = 0
for i in data :
    if i == a :
        count +=1
print(count)