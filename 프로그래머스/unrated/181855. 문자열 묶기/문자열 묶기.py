def solution(strArr):
    answer = 0
    c_1, c_2, c_3, c_4, c_5, c_6, c_7, c_8, c_9, c_10, c_11, c_12, c_13, c_14, c_15, c_16, c_17, c_18, c_19, c_20, c_21, c_22, c_23, c_24, c_25, c_26, c_27, c_28, c_29, c_30= 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    a = [len(i) for i in strArr]
    for c in a:
        if c == 1:
            c_1 += 1
        elif c == 2:
            c_2 += 1
        elif c == 3:
            c_3 += 1
        elif c == 4:
            c_4 += 1
        elif c == 5:
            c_5 += 1
        elif c == 6:
            c_6 += 1
        elif c == 7:
            c_7 += 1
        elif c == 8:
            c_8 += 1
        elif c == 9:
            c_9 += 1
        elif c == 10:
            c_10 += 1
        elif c == 11:
            c_11 += 1
        elif c == 12:
            c_12 += 1
        elif c == 13:
            c_13 += 1
        elif c == 14:
            c_14 += 1
        elif c == 15:
            c_15 += 1
        elif c == 16:
            c_16 += 1
        elif c == 17:
            c_17 += 1
        elif c == 18:
            c_18 += 1
        elif c == 19:
            c_19 += 1
        elif c == 20:
            c_20 += 1
        elif c == 21:
            c_21 += 1
        elif c == 22:
            c_22 += 1
        elif c == 23:
            c_23 += 1
        elif c == 24:
            c_24 += 1
        elif c == 25:
            c_25 += 1
        elif c == 26:
            c_26 += 1
        elif c == 27:
            c_27 += 1
        elif c == 28:
            c_28 += 1
        elif c == 29:
            c_29 += 1
        elif c == 30:
            c_30 += 1
    return max(c_1, c_2, c_3, c_4, c_5, c_6, c_7, c_8, c_9, c_10, c_11, c_12, c_13, c_14, c_15, c_16, c_17, c_18, c_19, c_20, c_21, c_22, c_23, c_24, c_25, c_26, c_27, c_28, c_29, c_30)