T = int(input())

n = 1

for _ in range(T) :
    A, B = map(int, input().split(' '))
    print("Case #{}: {} + {} = {}".format(n,A,B,A+B))
    n+=1