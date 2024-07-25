proc print data=class;
   title 'Acting Class Roster';
run;

data newClass;
   input Name $ 1-25 Year $ 26-34 Major $ 36-57;
   datalines;
Ali bin Abu.             second
Baba bin Mohan           third     Business Analytic
Chong Ai Ling            third     Accounting
Dory Tony                second    Finance
;
run;

proc print data=newClass;
   title 'New Acting Class Roster';
run;

proc append base=class data=newClass force;
run;

proc print data=class;
   title 'Updated Acting Class Roster';
run;