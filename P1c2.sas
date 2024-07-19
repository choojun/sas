data baseball;
	set sashelp.baseball (firstobs = 5 obs = 53);
run;
proc print data = baseball;
run;