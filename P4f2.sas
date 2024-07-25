data company;
   input Name $ 1-25 Age 27-28 Gender $ 30;
   datalines;
Vincent, Martina          34 F
Phillipon, Marie-Odile    28 F
Gunter, Thomas            27 M
Harbinger, Nicholas       36 M
Benito, Gisela            32 F
Rudelich, Herbert         39 M
Sirignano, Emily          12 F
Morrison, Michael         32 M
;
run;

proc sort data=company;
   by Name;
run;

proc print data=company;
   title 'Little Theater Company Roster';
run;



data finance;
   input IdNumber $ 1-11 Name $ 13-37 Salary;
   datalines;
074-53-9892 Vincent, Martina         35000
776-84-5391 Phillipon, Marie-Odile   29750
929-75-0218 Gunter, Thomas           27500
446-93-2122 Harbinger, Nicholas      33900
228-88-9649 Benito, Gisela           28000
029-46-9261 Rudelich, Herbert        35000
442-21-8075 Sirignano, Emily         5000
;
run;

proc sort data=finance;
   by Name;
run;



proc print data=finance;
   title 'Little Theater Employee Information';
run;



/* merge by name */
data employee_info;
   merge company finance; 
   by name;
run;

proc print data=employee_info;
   title 'Little Theater Employee Information';
   title2 '(including personal and financial information)';
run;

