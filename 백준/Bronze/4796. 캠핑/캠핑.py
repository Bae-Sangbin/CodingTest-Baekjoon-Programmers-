i = 1
while True:
    l, p, v = map(int, input().split())
    if p==0 and l==0 and v==0: # 0, 0, 0이 입력되면 반복문 종료
        break
        
    camping = (l * (v // p)) + min((v % p), l) # 캠핑장을 사용할 수 있는 최대 일수
    print(f'Case {i}: {camping}')
    i += 1