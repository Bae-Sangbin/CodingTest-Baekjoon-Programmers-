n = int(input())
def fibbonachi(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    return fibbonachi(n-2) + fibbonachi(n-1)
print(fibbonachi(n))