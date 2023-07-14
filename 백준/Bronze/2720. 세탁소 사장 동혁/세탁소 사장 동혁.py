T = int(input())
lst = list()
for i in range(T):
    lst.append(int(input()))
    
q,d,n,p = [0]*4

for i in range(T):
    result = lst[i]
    q+= result // 25
    result %= 25
    d += result // 10
    result %= 10
    n += result // 5
    result %= 5
    p += result // 1
    result %= 1
    print(q, d, n, p)
    q,d,n,p = [0]*4
    

