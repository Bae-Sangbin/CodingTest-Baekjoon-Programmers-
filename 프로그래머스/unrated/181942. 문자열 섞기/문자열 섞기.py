def solution(str1, str2):
    answer = ''
    for i in range(max(len(str1), len(str2))):
        answer = answer + str1[i] + str2[i]
    return answer