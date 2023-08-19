def solution(code):
    mode = 0
    ret = ''
    ret = []
    code = list(code)
    for idx in range(len(code)):
        if code[idx] == '1':
            if mode == 0:
                mode = 1
            elif mode == 1:
                mode = 0
        else:
            if mode == 0:
                if not code[idx] == 1:
                    if idx % 2 == 0:
                        ret.append(code[idx])
                else:
                    mode = 1
            elif mode == 1:
                if not code[idx] == 1:
                    if idx % 2 == 1:
                        ret.append(code[idx])
                else:
                    mode = 0
    if ret == []:
        return 'EMPTY'
    return ''.join(ret) 