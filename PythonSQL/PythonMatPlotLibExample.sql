/*
Create View MyPythonTestData  as 
select distinct F.ProductKey, F.TotalProductCost, F.ExtendedAmount, F.OrderQuantity,
F.SalesAmount, Year(F.OrderDate) as OrderYear, 
P.EnglishProductName, C.EnglishProductCategoryName,  S.EnglishProductSubcategoryName
from FactResellerSales F 
join DimProduct P on F.ProductKey = P.ProductKey
join DimProductSubcategory S on S.ProductSubcategoryKey = P.ProductSubcategoryKey
join DimProductCategory C on C.ProductCategoryKey = S.ProductCategoryKey
-- Order by F.ProductKey, Year(F.OrderDate)
*/

execute sp_execute_external_script 
@language = N'Python',
@script = N'
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
 
# Create data
# colors = (0,0,0)
# area = np.pi*3
 
# fig_handle = plt.figure(figsize=(10,10))
# plt.scatter(InputDataSet.ExtendedAmount, InputDataSet.TotalProductCost, s=area, c=colors, alpha=0.5)
# plt.title("Scatter plot example")
# plt.xlabel("Sales Amount")
# plt.ylabel("Total Production Cost")
# plt.savefig("c:\\scatterplot.png")
 
',
@input_data_1 = N'Select cast(TotalProductCost as float) TotalProductCost, cast(ExtendedAmount as float) ExtendedAmount from MyPythonTestData'