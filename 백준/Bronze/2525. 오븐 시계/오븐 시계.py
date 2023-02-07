input_data = input().split(' ')
hour = int(input_data[0])
min = int(input_data[1])
time = int(input())

min = min + time
if min < 60 :
    print(str(hour) + ' ' + str(min))
elif min >= 60 :
    hour += 1
    min -= 60
    while min >= 60 :
        hour += 1
        min -= 60
    if hour < 24:
        print(str(hour) + ' ' + str(min))
    elif hour >= 24 :
        hour -= 24 
        print(str(hour) + ' ' + str(min))