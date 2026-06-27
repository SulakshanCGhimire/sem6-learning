# 11. Write a program to find the mean, median, minimum, and maximum of a NumPy array.

import numpy as np

# Create a NumPy array
arr = np.array([15, 8, 25, 12, 30, 5, 18, 22])

print("Array:", arr)

# Calculate Mean, Median, Minimum, and Maximum
meanVal = np.mean(arr)
medianVal = np.median(arr)
minVal = np.min(arr)
maxVal = np.max(arr)

print(f"\nMean: {meanVal}")
print(f"Median: {medianVal}")
print(f"Minimum: {minVal}")
print(f"Maximum: {maxVal}")