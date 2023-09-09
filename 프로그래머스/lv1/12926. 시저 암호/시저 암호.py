def solution(s, n):
    UPPER_ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lower_alpha = "abcdefghijklmnopqrstuvwxyz"
    answer = ""
    for char in s:
        if char.islower():
            answer += lower_alpha[(lower_alpha.index(char) + n) % 26]
        elif char.isupper():
            answer += UPPER_ALPHA[(UPPER_ALPHA.index(char) + n) % 26]
        else:
            answer += " "
    return answer