# 21. Write a program to create a pie chart showing percentage distribution of grades.

import matplotlib.pyplot as plt

# Sample grade data
grades = ['A', 'B', 'C', 'D', 'F']
counts = [12, 18, 8, 3, 2]  # number of students in each grade

# Define colors for each slice (optional)
colors = ['blue', 'green', 'red', 'purple', 'orange']

# Create pie chart
plt.pie(counts, labels=grades, colors=colors, autopct='%1.1f%%', 
        startangle=90, explode=(0, 0, 0, 0, 0), shadow=False)

# Add a title
plt.title('Grade Distribution of Students')

# Ensure the pie is a circle (equal aspect ratio)
plt.axis('equal')

# Display the chart
plt.show()