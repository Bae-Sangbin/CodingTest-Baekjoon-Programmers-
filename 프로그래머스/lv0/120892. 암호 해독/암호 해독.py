def solution(cipher, code):
    answer = ''
    for i in cipher[code-1::code]:
        answer = answer + i
    return answer