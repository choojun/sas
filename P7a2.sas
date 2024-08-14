proc print data=sashelp.CARS;
	title "CARS";
run;


/* Displays the crosstabulation of the 
targeted dataset by Make and Type:
*/
title1 'Customer Satisfaction Survey';
title2 'Strata of Customers';
proc freq data=sashelp.CARS;
   tables make*type;
run;


/* The code selects a probability sample of customers from the 
targeted dataset according to the stratified sample design.
*/
title1 'Customer Satisfaction Survey';
title2 'Stratified Sampling';
proc surveyselect data=sashelp.CARS method=srs n=1 
                  seed=1957 out=SampleStrata;
   strata make type;
run;

proc print data=SampleStrata;
	title "Samples of Stratified Sampling for Your Analysis";
run;