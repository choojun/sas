proc tabulate data=sashelp.cars;
   var MSRP;   
   class type;
   
   /* Adding classification variable and statistic */
   table MSRP*type*sum MSRP*type*mean;
run;

*proc print data=sashelp.cars;
*run;