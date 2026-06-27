# 7. Write a program to create a function that returns the square and cube of a number. 

def square(num):
    return num ** 2

def cube(num):
    return num ** 3

n = float(input("Enter a number: "))

# Call functions and display results
print(f"Square of {n}: {square(n)}")
print(f"Cube of {n}: {cube(n)}")