str = input()
answer = ''
for i in str:
    if i.islower():
        answer = answer + i.upper()
    else:
        answer = answer + i.lower()
print(answer)
