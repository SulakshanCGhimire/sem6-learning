# 19. Write a program to create a bar chart comparing marks of five students. 

import matplotlib.pyplot as plt

# Data
students = ['Ram', 'Shyam', 'Sita', 'Gita', 'Hari']
marks = [85, 78, 92, 88, 79]

# Create bar chart
plt.bar(students, marks, color=['blue', 'green', 'red', 'purple', 'orange'], edgecolor='black')

# Add labels and title
plt.xlabel('Students')
plt.ylabel('Marks')
plt.title('Comparison of Student Marks')

# Add value labels on top of each bar
for i, value in enumerate(marks):
    plt.text(i, value + 1, str(value), ha='center', fontweight='bold')

# Set y-axis limit to give some space above bars
plt.ylim(0, max(marks) + 10)

# Display the chart
plt.show()