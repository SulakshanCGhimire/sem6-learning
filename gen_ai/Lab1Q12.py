# 12. Write a program to generate 10 random numbers using NumPy and display them. 

import numpy as np

# Generate 10 random numbers between 0 and 1 as np.random.rand() generates random numbers in the range [0, 1)
random_numbers = np.random.rand(10)

print("10 random numbers between 0 and 1:")
print(random_numbers)