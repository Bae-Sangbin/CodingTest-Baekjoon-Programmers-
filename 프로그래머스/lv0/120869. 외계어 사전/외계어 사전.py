def solution(spell, dic):
    for word in dic:
        if len(word) == len(spell):
            valid = True
        else:
            valid = False
        for alpha in spell:
            if word.count(alpha) == 1:
                pass
            else:
                valid = False
        if valid:
            return 1
    return 2