# 20. Write a program to create a histogram to visualize the distribution of marks.

import matplotlib.pyplot as plt

# Sample marks data
marks = [85, 78, 92, 88, 79, 67, 91, 73, 84, 90,
         95, 82, 77, 81, 89, 76, 83, 68, 94, 86]

# Create histogram
# bins=5 means we divide marks into 5 equal intervals (e.g., 60-70, 70-80, etc.)
plt.hist(marks, bins=5, color='skyblue', edgecolor='black', alpha=0.7)

# Add labels and title
plt.xlabel('Marks Range')
plt.ylabel('Number of Students')
plt.title('Distribution of Student Marks')

# Optional: add grid for better readability
plt.grid(axis='y', linestyle='--', alpha=0.6)

# Display the histogram
plt.show()