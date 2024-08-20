proc tabulate data=sashelp.cars;
   class origin make type;
   var invoice; *VAR can be continuous or discrete;
   table make*type, invoice*origin 
		/ rts=20;
run;

/* RTS option provides enough space to display 
the column headings without hyphenating them.
*/

proc print data=SASHELP.CARS;
run;