T = int(input())
count_a, count_b, count_c = [0]*3
A = 300
B = 60
C = 10
if T % 10 != 0:
    print(-1)
else:
    count_a += T // A
    T %= A
    count_b += T // B
    T %= B
    count_c += T // C
    T %= C
    print(count_a, count_b, count_c)