def solution(a, b, c, d):
    answer = 0
    if a == b == c == d:
        answer = a * 1111
    elif a == b == c:
        answer = (10 * a + d) ** 2
    elif a == b == d:
        answer = (10 * a + c) ** 2
    elif a == c == d:
        answer = (10 * a + b) ** 2
    elif b == c == d:
        answer = (10 * b + a) ** 2
    elif a == b and c == d:
        answer = (a+c) * abs(a-c)
    elif a == c and b == d:
        answer = (a+b) * abs(a-b)
    elif a == d and b == c:
        answer = (a+b) * abs(a-b)
    elif a == b and not c == d:
        answer = c * d
    elif a == c and not b == d:
        answer = b * d
    elif a == d and not b == c:
        answer = b * c
    elif b == c and not a == d:
        answer = a * d
    elif b == d and not a == c:
        answer = a * c
    elif c == d and not a == b:
        answer = a * b
    else:
        answer = min(a,b,c,d)
    return answer