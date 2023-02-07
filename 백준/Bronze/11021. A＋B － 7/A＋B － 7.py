test_case = int(input())
n=1


for _ in range(test_case) :
    A, B = map(int, input().split())
    print("Case #{0}: {1}".format(n,A+B))
    n+=1