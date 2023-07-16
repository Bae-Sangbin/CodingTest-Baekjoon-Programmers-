N, K = map(int, input().split())
coin_lst = list()
for i in range(N):
    coin_lst.append(int(input()))
count = 0
for a in reversed(coin_lst):
    count += K // a
    K %= a
print(count)
