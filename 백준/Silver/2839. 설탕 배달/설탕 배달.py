N = int(input())
count = 0
if N % 5 == 0: # N이 5의 배수이면
    count+=N//5 # count를 5의 배수만큼 크게 하고
    print(count)
elif N > 17:
    while N % 5 != 0 :
        count += 1
        N -= 3
        if N < 5:
            print(-1)
            break
    if N % 5 == 0:
        count += N // 5
        N %= 5
        print(count)
elif N > 5 : # N이 5보다 크면서 5의 배수가 아닌 것
    while N % 3 != 0 :
        count += 1
        N = N - 5
        if N < 3:
            print(-1)
            break
    if N % 3 == 0:
        count += N // 3
        N %= 3
        print(count)
elif N == 3:
    count += N // 3
    N %= 3
    print(count)
else :
    print(-1)
    
