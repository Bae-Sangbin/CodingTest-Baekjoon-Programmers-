T = int(input())
data = list()
for _ in range(T):
    data.append(int(input()))
    
q = d = n = p = 0
for i in range(len(data)):
    result = data[i]
    q += result // 25
    result %= 25
    d += result // 10
    result %= 10
    n += result // 5
    result %= 5
    p += result // 1
    result %= 1
    print(q,d,n,p)
    q = d = n = p = 0
