def solution(M, D):
    days_in_month = {1:31, 2:29, 3:31, 4:30,
                    5:31, 6:30, 7:31, 8:31,
                    9:30, 10:31, 11:30, 12:31}
    days = D
    for m in range(1, M):
        days += days_in_month[m]
    return ['THU','FRI','SAT', "SUN",'MON','TUE','WED'][days%7]