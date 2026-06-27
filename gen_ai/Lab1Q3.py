# 3. Write a program to find the largest of three numbers using if-elif-else statements. 

try:
    num1 = float(input("Enter first number: "))
    num2 = float(input("Enter second number: "))
    num3 = float(input("Enter third number: "))
except ValueError:
    print("Invalid input. Please enter numeric values.")
    exit()

# Find largest using if-elif-else
if num1 >= num2 and num1 >= num3:
    largest = num1
elif num2 >= num1 and num2 >= num3:
    largest = num2
else:
    largest = num3

# Display result
print(f"Largest Number: {largest}")