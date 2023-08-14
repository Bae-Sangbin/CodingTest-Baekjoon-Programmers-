def solution(binomial):
    answer = 0
    if '+' in binomial:
        a1,b1 = binomial.replace(' ', '').split('+')
        answer = int(a1)+int(b1)
    elif '-' in binomial:
        a2,b2 = binomial.replace(' ', '').split('-')
        answer = int(a2)-int(b2)
    else:
        a3,b3 = binomial.replace(' ', '').split('*')
        answer = int(a3)*int(b3)
    return answer