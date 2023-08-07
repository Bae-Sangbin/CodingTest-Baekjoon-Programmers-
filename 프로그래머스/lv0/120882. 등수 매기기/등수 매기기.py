def solution(score):
    정렬된점수 = sorted([sum(i) for i in score], reverse = True)
    return [정렬된점수.index(sum(j)) + 1 for j in score]