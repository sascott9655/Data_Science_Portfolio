#Testing code
import numpy as np
import pandas as pd
from scipy.stats import trim_mean

df = pd.read_csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/OA 2.2 - USArrests.csv')
mean = df['Murder'].mean()
t = trim_mean(df['Murder'], 0.1)
median = df['Murder'].median()

print(mean, t, median)
