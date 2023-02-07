data = int(input())
if (data % 100 != 0 and data % 4==0) or (data % 400==0) :
    print(1)
else :
    print(0)