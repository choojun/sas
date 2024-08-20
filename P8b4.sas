proc tabulate data=sashelp.cars;
   class make type DriveTrain Cylinders;
   table make*(n='Quantity'), 
   		DriveTrain*Cylinders;
   title 'Car Quantity of Make in Each Type 
   			by DriveTrain and Cylinders';
run;

*proc print data=SASHELP.CARS;
*run;