total_amount = int(input())
times = int(input())

for i in range(times) :
    amount, units = input().split()
    amount, units = int(amount), int(units)
    
    total_amount -= (amount * units)
    
print("Yes" if total_amount == 0 else "No")