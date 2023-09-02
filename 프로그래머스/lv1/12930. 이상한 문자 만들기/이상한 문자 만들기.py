def solution(s):
    answer = "" 
    idx = -1
    for char in s:
        if char == ' ':
            idx = -1
            answer += " "
        else:
            idx += 1
            if idx % 2 == 0:
                answer += char.upper()
            else:
                answer += char.lower()
    return answer