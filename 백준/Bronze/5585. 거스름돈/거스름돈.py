T = int(input())
money = 1000-T
count = 0

coin_lst = [500, 100, 50, 10, 5, 1]
coin_lst.sort(reverse = True)

for i in range(len(coin_lst)):
    count += money // coin_lst[i]
    money %= coin_lst[i]

print(count)