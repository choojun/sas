data myData;
    input customer $ myDate : date9.;
    format myDate date9.; 
    datalines;
Sam 01JAN2024
Dave 15FEB2024
Donald 10MAR2024
Bill 05APR2024
James 20MAY2024
;
run;

proc print data=myData;
run;

/* Add days */
data outData;
set myData;
newDate = INTNX('day', myDate, 10);
format newDate date9.;
run;

proc print data=outData;
	title "Add days";
run;

/* Add weekdays */
data outData;
set myData;
weekdays_5 = INTNX('weekday', myDate, 5);
format weekdays_5 date9.;
run;

proc print data=outData;
	title "Add weekdays";
run;

/* Add months */
data outData;
set myData;
newDate = INTNX('month', myDate, 13);
format newDate date9.;
run;

proc print data=outData;
	title "Add months";
run;

/* subtract days */
data outData;
set myData;
date_minus10 = INTNX('day', mydate, -10);
format date_minus10 date9.;
run;

proc print data=outData;
	title "Subtract days";
run;



