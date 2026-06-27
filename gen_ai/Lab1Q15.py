# 15. Write a program to handle missing values in a dataset using Pandas (fill or drop)

import pandas as pd
import numpy as np

# Create a dataset with missing values
data = {
    'Name': ['Ram', 'Shyam', 'Sita', 'Gita', 'Hari'],
    'Age': [20, np.nan, 22, 21, np.nan],
    'Marks': [85, 78, np.nan, 88, 92]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Check missing values
print("\nMissing values count:")
print(df.isnull().sum())

# Drop rows with any missing value
df_dropped = df.dropna()
print("\nAfter dropping rows with missing values:")
print(df_dropped)

# Fill missing values (Age with mean, Marks with 75)
df_filled = df.copy()  # work on a copy to keep original unchanged
df_filled['Age'] = df_filled['Age'].fillna(df_filled['Age'].mean())
df_filled['Marks'] = df_filled['Marks'].fillna(75)

print("\nAfter filling missing values")
print(df_filled)
