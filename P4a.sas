data class;
   /* specific the length */
   input Name $25. Year $9. Major $23.;
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


