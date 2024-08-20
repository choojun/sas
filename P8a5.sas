proc tabulate data=sashelp.cars;
   var MSRP;   
   class type;
   
   /* use parentheses () */
   table MSRP*type*(sum mean);
   table MSRP*(sum mean)*type;
run;

*proc print data=sashelp.cars;
*run;