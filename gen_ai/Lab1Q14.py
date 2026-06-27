# 14. Write a program to filter students who have marks greater than 75 using Pandas.

import pandas as pd

# Create the student DataFrame
data = {
    'Name': ['Ram', 'Shyam', 'Sita', 'Gita', 'Hari'],
    'Age': [20, 21, 19, 20, 22],
    'Marks': [85, 78, 92, 68, 69]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# Filter students with Marks > 75
filtered_df = df[df['Marks'] > 75]

print("\nStudents with marks greater than 75:")
print(filtered_df)