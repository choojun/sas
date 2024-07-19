data baseball;
	set sashelp.baseball;
run;
proc print data = baseball;
	title "My Baseball Dataset"
run;