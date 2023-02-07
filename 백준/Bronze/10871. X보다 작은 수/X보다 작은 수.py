N, X = map(int, input().split())
array = list(map(int, input().split()))

for i in array :
    if i < X :
        print(i, end=" ")