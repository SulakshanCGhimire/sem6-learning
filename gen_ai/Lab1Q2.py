# 2. Write a program to check whether a given number is even or odd using conditional statements. 

try:
    num = int(input("Enter an integer: "))
except ValueError:
    print("Invalid input. Please enter an integer.")
    exit()

# Conditional check(Even/Odd)
if num % 2 == 0:
    print(f"{num} is even")
else:
    print(f"{num} is odd")