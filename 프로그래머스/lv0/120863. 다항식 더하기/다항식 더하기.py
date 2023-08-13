def solution(polynomial):
    x, n = 0, 0  # xsum, nsum
    result = ''
    pol = polynomial.replace(' ', '').split('+')
    for p in pol:
        if 'x' in p:
            if len(p) > 1:
                x += int(p[:-1])
            else:
                x += 1
        else:
            n += int(p)
    if x == 0:
        return '{}'.format(n)
    elif x == 1:
        if n == 0:
            return 'x'
        elif n != 0:
            return 'x + {}'.format(n)
    elif x > 1:
        if n == 0:
            return '{}x'.format(x)
        elif x != 0:
            return '{}x + {}'.format(x, n)
    
    