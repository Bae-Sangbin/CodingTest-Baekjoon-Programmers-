def solution(num, total):
    mid = total // num
    half = num // 2
    top = mid + half +1
    bot = top - num
    answer = [i for i in range(bot, top)]
    return answer