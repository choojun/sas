data myData;
    INPUT ID $ Name $ Gender $ Age Height Weight;
    DATALINES;
    001 Ali M 25 180 .
    002 . F 30 170 70
    003 Fatimah F . 160 60
    004 Baba M 35 . 80
    005 Emily . 40 155 .
    ;
run;

proc means data=myData NMISS N;
run;

/* NMISS counts missing values.
N option counts non-missing values for each numeric variable in a SAS dataset
*/

proc means data=mydata NMISS N;
var Height Weight;
run;

Proc Means data = mydata N NMISS MISSING;
Class Gender;
Var Height Weight;
Run;

proc sql; 
select  nmiss(gender) as n_missing_gender, 
		nmiss(name) as n_missing_name, 
		nmiss(weight) as n_missing_weight 
from mydata; 
quit;


/* Count Missing Values of All Variables */
proc format;
 value $missfmt ' '='Missing' other='Non-Missing';
 value  missfmt  . ='Missing' other='Non-Missing';
run;
 
proc freq data=mydata; 
format _CHAR_ $missfmt.;
tables _CHAR_ / missing missprint nocum nopercent;
format _NUMERIC_ missfmt.;
tables _NUMERIC_ / missing missprint nocum nopercent;
run;


/* Save to a dataset */
proc means data=mydata NMISS N stackods;
ods output summary=newData;
run;

proc print data = newData;
run;


