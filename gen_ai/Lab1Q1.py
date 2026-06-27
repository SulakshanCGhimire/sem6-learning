# 1. Write a program to take two numbers as input and perform addition, subtraction, multiplication, and division.

try:
    num1 = float(input("Enter first number: "))
    num2 = float(input("Enter second number: "))
except ValueError:
    print("Invalid input. Please enter numeric values.")
    exit()

# Addition, subtraction, multiplication
addition = num1 + num2
subtraction = num1 - num2
multiplication = num1 * num2

# Division: handle division by zero
if num2 != 0:
    division = num1 / num2
else:
    division = "undefined (cannot divide by zero)"

print("Operations results:")
print(f"{num1} + {num2} = {addition}")
print(f"{num1} - {num2} = {subtraction}")
print(f"{num1} * {num2} = {multiplication}")
print(f"{num1} / {num2} = {division}")