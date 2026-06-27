# 10. Write a program to reshape a 1D NumPy array into a 2D array (3×4 and 4×3). 

import numpy as np

# Create a 1D array (3*4 = 12 elements)
arr_1d = np.arange(1, 13)  # numbers from 1 to 12
print("Original 1D array:")
print(arr_1d)

# Reshape into 3×4 (3 rows, 4 columns)
arr_3x4 = arr_1d.reshape(3, 4)
print("Reshaped to 3×4 array:")
print(arr_3x4)

# Reshape into 4×3 (4 rows, 3 columns)
arr_4x3 = arr_1d.reshape(4, 3)
print("Reshaped to 4×3 array:")
print(arr_4x3)