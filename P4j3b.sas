data maxMinValue;
	set sashelp.BASEBALL;

array data(2) nHits Crhits;
min_value = min (of data(*));
max_value = max (of data(*));
run;

proc print data=maxMinValue;
run;
