data exercise;
   merge class (drop=Year Major)
   class2 (drop=Year Major rename=(Name=Name2))
   time_slot;
run;

proc print data=exercise;
   title 'Acting Class Exercise Schedule';
run;