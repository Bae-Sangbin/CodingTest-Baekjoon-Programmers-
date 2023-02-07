arr = []

for _ in range(10) :
    a = int(input())
    b = a % 42
    arr.append(b)
    
s = set(arr)
print(len(s))