proc means data = sashelp.CARS Mean SUM MAXDEC=2;   
class make type;   
var horsepower;   
run;  

proc print data=sashelp.CARS;
run;