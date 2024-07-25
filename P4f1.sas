proc sort data=exercise;
   *by Name;
   by Name2;
run;

proc print data=exercise;
   title 'Sorted - Acting Class Exercise Schedule';
run;