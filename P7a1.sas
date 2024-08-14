data myData;
    input customer $ salesDate : date9.;
    format salesDate date9.; 
    datalines;
Sam 01JAN2024
Dave 15FEB2024
Donald 10MAR2024
Bill 05APR2024
James 20MAY2024
;
run;

proc print data=myData;
	title "myData";
run;

/* Select a probability sample of customers from the 
targeted data set by using simple random sampling.
*/
title1 'Customer Satisfaction Survey';
title2 'Simple Random Sampling';
proc surveyselect data=myData method=srs n=3
                  out=SampleSRS;
run;

proc print data=SampleSRS;
	title "Samples of Simple Random Sampling for Your Analysis";
run;
