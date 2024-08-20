proc tabulate data=sashelp.cars;
   var MSRP; /* for character variable */
   class type drivetrain; /* for numeric variable */
   
   table MSRP; /* for operation use */
   table type drivetrain; /* for operation use */
run;

*proc print data=sashelp.cars;
*run;