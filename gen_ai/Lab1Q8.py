# 8. Write a program to take a list of numbers and find their sum and average using a function. 

def getSum(numbers):
    total = 0
    for num in numbers:
        total += num
    return total

def getAverage(numbers):
    if not numbers:
        return 0
    return sum(numbers) / len(numbers)

# Get input from user
input_str = input("Enter numbers separated by spaces: ")

# Convert to list of floats
try:
    numList = [float(x) for x in input_str.split()]
except ValueError:
    print("Invalid input. Please enter numeric values only.")
    exit()

if len(numList) == 0:
    print("No numbers entered.")
    exit()

# Call the functions
total = getSum(numList)
average = getAverage(numList)

# Display results
print(f"Numbers: {numList}")
print(f"Sum: {total}")
print(f"Average: {average}")