data airlines_create;
	set sashelp.airline;
	/*A variable Month is used to show
	numberic month number */
	Month = month(date);
run;

proc print data = airlines_create;
	title "My Airlines";
run;