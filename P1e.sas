data airlines_create;
	set sashelp.airline;
 
	/* A variable month is used to show
	numberic month number */
	month = month(date);
run;

proc print data = airlines_create;
	title "My Airlines";
run;
