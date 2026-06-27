# 6. Write a program to create a simple calculator using functions (add, subtract, multiply, divide). 

# Calculator functions
def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    if y != 0:
        return x / y
    else:
        return "Error: Division by zero!"

# Main program
def main():
    print("Calculator Operations:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Exit")

    while True:
        try:
            choice = int(input("\nEnter your choice (1-5): "))
        except ValueError:
            print("Invalid input. Please enter a number.")
            continue

        if choice == 5:
            print("Thank you!")
            break

        if choice < 1 or choice > 4:
            print("Invalid choice. Please choose 1-4 or 5 to exit.")
            continue

        # Input numbers 
        try:
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))
        except ValueError:
            print("Invalid number. Please enter numeric values.")
            continue 

        # Perform the selected operation
        if choice == 1:
            result = add(num1, num2)
            print(f"{num1} + {num2} = {result}")
        elif choice == 2:
            result = subtract(num1, num2)
            print(f"{num1} - {num2} = {result}")
        elif choice == 3:
            result = multiply(num1, num2)
            print(f"{num1} * {num2} = {result}")
        elif choice == 4:
            result = divide(num1, num2)
            print(f"{num1} / {num2} = {result}")

# Run the program
if __name__ == "__main__":
    main()