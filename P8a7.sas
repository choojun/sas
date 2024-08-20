proc tabulate data=sashelp.class;
   class sex age;
   var height weight;
   table sex,age*(height weight)*(sum mean min max);
run;

proc print data=sashelp.class;
run;