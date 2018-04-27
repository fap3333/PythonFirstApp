execute sp_execute_external_script 
@language = N'Python',
@script = N'
 
var1 = "Siddharth"
Var1 = "Sid"
var2 = 100
var3 = 50.5
var4 = "TRUE"
 
print(var1)
print(Var1)
print(var2 + var3)
print(var4)
 
print(type(var1))
print(type(var2))
print(type(var3))
print(type(var4))
'