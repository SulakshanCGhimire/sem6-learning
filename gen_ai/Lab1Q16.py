# 16. Write a program to group student data by category and find average marks using GroupBy.

import pandas as pd

# Sample dataset
data = {
    'Name': ['Ram', 'Shyam', 'Sita', 'Gita', 'Hari', 'Rita', 'Mohan'],
    'Department': ['Science', 'Commerce', 'Science', 'Arts', 'Commerce', 'Science', 'Arts'],
    'Marks': [85, 78, 92, 88, 79, 91, 84]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Group by 'Department' and calculate average marks
grouped = df.groupby('Department')['Marks'].mean()

print("\nAverage marks by department:")
print(grouped)