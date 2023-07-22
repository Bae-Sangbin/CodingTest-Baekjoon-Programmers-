N = int(input())
def factorial_recursive(N):
    if N <= 1 :
        return 1
    return N * factorial_recursive(N-1)
print(factorial_recursive(N))