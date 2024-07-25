data class;
   input Name $1-25 Year $26-34 Major $35-57;
   datalines;
Abbott, Jennifer         first
Carter, Tom              third     Data Science
Mendoza, Elissa          fourth    Software Engineering
Tucker, Rachel           first
Uhl, Roland              second
Wacenske, Maurice        third     Information Technology
;
run;

proc print data=class;
   title 'Acting Class Roster';
run;


