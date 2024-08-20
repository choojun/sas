proc tabulate data=sashelp.cars;
   var MSRP; /* for character variable */
   class type drivetrain; /* for numeric variable */
   
   /* Adding statistic:
   		sum, mean, stddev, var, pctn, nmiss
   		p75, median, p25, qrange
   */
   table MSRP*type*sum MSRP*type*mean;
   *table MSRP*type*stddev MSRP*type*min;
run;

*proc print data=sashelp.cars;
*run;