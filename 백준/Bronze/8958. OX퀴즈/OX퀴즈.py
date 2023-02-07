N = int(input())
for _ in range(N):
    A = list(str(input()))
    score = 0
    con = 0
    for j in A:
        if j == "O":
            con += 1
            score += con
        elif j == "X":
            con = 0
    print(score)