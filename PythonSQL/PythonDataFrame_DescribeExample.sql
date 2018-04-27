-- grab some data from table (table has 60K rows)
/*
Select top 10
	fis.TotalProductCost
	, fis.UnitPrice
	, fis.OrderQuantity
	, fis.SalesAmount
	, fis.TaxAmt
	, fis.Freight
	, fis.ExtendedAmount
From FactInternetSales fis
*/
-- run python script
execute sp_execute_external_script
@language = N'Python',
@script = N'
import pandas as pd
# library within Python
from pandas import DataFrame

# data coming in and out of Python needs to be in form of DataFrame
# describe is a basic function to dervice basics of data...
OutputDataSet = pd.DataFrame(InputDataSet.describe())
',
@input_data_1 = N'select cast(TotalProductCost as float) as TotalProductCost, cast(UnitPrice as float) as UnitPrice,
Orderquantity, cast(SalesAmount as float) as SalesAmount, cast(TaxAmt as float) as TaxAmt, cast(Freight as float) as Freight,
cast(ExtendedAmount as float) as ExtendedAmount from FactInternetSales'
with result sets ((TotalProductCost float, UnitPrice float, Orderquantity float,
SalesAmount float, TaxAmt float, Freight float, ExtendedAmount float))

/*
The result set is count, mean, standard deviation, min, max, quartiles 
*/


