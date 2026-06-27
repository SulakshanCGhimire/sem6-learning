# 9. Write a program to create a NumPy array and perform addition, subtraction, multiplication, and division operations. 

import numpy as np

# Create two NumPy arrays
arr1 = np.array([10, 20, 30, 40])
arr2 = np.array([2, 4, 6, 8])

print("First array:", arr1)
print("Second array:", arr2)

# Perform element-wise operations
addition = arr1 + arr2
subtraction = arr1 - arr2
multiplication = arr1 * arr2
division = arr1 / arr2   # NumPy handles division element-wise

# Display results
print("Addition (arr1 + arr2):", addition)
print("Subtraction (arr1 - arr2):", subtraction)
print("Multiplication (arr1 * arr2):", multiplication)
print("Division (arr1 / arr2):", division)