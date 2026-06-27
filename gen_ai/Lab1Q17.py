# 17. Write a program to read a CSV file using Pandas and display its first 5 rows. 

import pandas as pd

# Read the CSV file
df = pd.read_csv('C:\\Users\\suluc\\Desktop\\SurveyAnalyzer\\data\\nepal_earthquake.csv')

# Display the first 5 rows
print("First 5 rows of the dataset:")
print(df.head()) # For first 5 rows, we can use either df.head() or df.head(5)