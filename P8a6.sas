proc tabulate data=sashelp.cars;
   var MSRP;   
   class type;

   /* use ALL to calculate overall statistics */
   table type all (type all)*MSRP*mean;
run;

*proc print data=sashelp.cars;
*run;