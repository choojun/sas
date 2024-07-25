data maxMinValue;
	set sashelp.BASEBALL;

array data(*) _numeric_;
min_value = min (of data(*));
max_value = max (of data(*));
run;

proc print data=maxMinValue;
run;
