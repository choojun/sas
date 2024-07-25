proc print data=class;
   title 'Acting Class Roster';
run;

proc print data=time_slot;
   title 'Dates, Times, and Locations of Conferences';
run;

data schedule;
   merge class time_slot;
run;

proc print data=schedule;
   title 'Student Conference Assignments';
run;