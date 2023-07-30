def solution(my_string):
    answer = ''
    vowel = 'aeiou'
    for i in my_string:
        if i not in vowel:
            answer = answer + i
    return answer