proc tabulate data=sashelp.cars;
   var MSRP; /* for character variable */
   class type drivetrain; /* for numeric variable */
   
   /* Adding classification variable */
   table MSRP*type MSRP*drivetrain;
run;

*proc print data=sashelp.cars;
*run;