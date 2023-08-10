def solution(my_string):
    answer = ''
    for s in my_string:
        if s.isupper():
            s = s.lower()
            answer = answer + s
        else :
            answer = answer + s
    answer = sorted(answer)
    answer = ''.join(answer)
    return answer