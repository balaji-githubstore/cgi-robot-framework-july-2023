"""
This module will be deleted later
"""
import pandas

from utilities import read_file

df=pandas.read_excel("../test_data/OpenEMRData.xlsx","test_valid_login")
print(df)

# print(df.loc[0])
#
# print(df.index)
#
data=[]
for i in df.index:
    print(data.append(list(df.loc[i])))

print(data)
#
#

print(df.loc[0])
print(df.loc[1])

print(df.values.tolist())

res=read_file.get_data_from_excel("../test_data/OpenEMRData.xlsx", "test_valid_login")
print(res)