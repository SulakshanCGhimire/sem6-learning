# 18. Write a program to plot a line graph using Matplotlib for student marks over time.

import matplotlib.pyplot as plt

# Sample data: time points (tests or months) and corresponding marks
time_points = ['Jan', 'Feb', 'Mar', 'Apr', 'May']
marks = [65, 70, 85, 80, 92]

# Create the line plot
plt.plot(time_points, marks, marker='o', linestyle='-', color='green', linewidth=2, markersize=8)

# Add labels and title
plt.xlabel('Months')
plt.ylabel('Marks')
plt.title('Student Marks Over Time')

# Add a grid for easier reading
plt.grid(True, linestyle='--', alpha=0.6) # Turn grid on with dashed lines and some transparency

# Display the plot
plt.show()