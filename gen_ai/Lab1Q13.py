# 13. Write a program to create a Pandas DataFrame for student details (Name, Age, Marks). 

import pandas as pd

# Sample student data
data = {
    'Name': ['Ram', 'Shyam', 'Sita', 'Gita', 'Hari'],
    'Age': [20, 21, 19, 20, 22],
    'Marks': [85, 78, 92, 88, 79]
}

# Create DataFrame
df = pd.DataFrame(data)

# Display the DataFrame
print("Student Details DataFrame:")
print(df)