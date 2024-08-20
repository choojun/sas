proc tabulate data=sashelp.cars;
   class drivetrain origin type;
   var MSRP horsepower;
   table all (drivetrain type) * (N colpctn)
   		(MSRP type*horsepower) * (mean std),
   		(origin all);
run;

*proc print data=SASHELP.CARS;
*run;