data = input().split(' ')
A = int(data[0])
B = int(data[1])
C = int(data[2])

if (A == B == C) :
    print(10000 + (A * 1000))
elif (A == B) :
    print(1000 + (A * 100))
elif (B == C) :
    print(1000 + (B * 100))
elif (A == C) :
    print(1000 + (A * 100))
else :
    print(int(max(data)) * 100)