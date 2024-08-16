data lunch;
   input studentAge spending pocketMoney Students @@;
   datalines;
17   7  39  2   17   7  38  1   18  12  47  1
19  10  47  4   17   1  34  4   17  10  43  2
17   3  44  4   18  20  60  3   18  19  57  4
17   2  35  2   17   2  36  1   19  15  51  1
18  16  53  1   17   6  37  4   17   6  41  2
17   6  39  2   19  15  50  4   18  17  57  3
18  14  46  2   19   8  41  2   19   8  41  1
19   7  47  3   17   3  39  3   17  12  50  2
17   4  43  4   19  14  46  3   18  18  58  4
19   9  44  3   17   2  37  1   17   1  37  2
17   4  44  2   17  11  42  2   19   8  41  2
18  10  42  2   18  13  46  1   17   2  40  3
19   6  45  1   19  11  45  4   17   2  36  1
17   9  46  1
;

* Porportion of total 4000 students;
data StudentTotals;
   input studentAge _TOTAL_;
   datalines;
17 1824
18 1025
19 1151
;

* Weight for respecctive studentAge;
data lunch2;
   set lunch;
   if studentAge=17 then Prob=20/1824;
   if studentAge=18 then Prob=9/1025;
   if studentAge=19 then Prob=11/1151;
   Weight = 1/Prob;
run;

proc print data=lunch2;
	title "lunch2";
run;

/* The STRATA statement specifies the stratification variable studentAge. 
The LIST option in the STRATA statement requests that 
the stratification information be displayed. 
The WEIGHT statement specifies the weight variable.
*/

ods graphics on;
title1 'Lunch Spending Analysis';
title2 'using Stratified Sample Design';
proc surveyreg data=lunch2 total=StudentTotals;
   strata studentAge /list;
   model spending = pocketMoney;
   weight Weight;
   
   *use the Output Delivery System (ODS) to create SAS data sets 
   that capture the outputs from PROC SURVEYREG;
   ods output ParameterEstimates = MyParamEstim;
run;


proc print data=MyParamEstim;
run;

/* It summarizes the data information, 
the sample design information, and the fit information. 
With the stratification, the denominator degrees of freedom for 
F tests and t tests are 37, 
which are different from those in the analysis, 
as compared with the SRS output.

It displays the information for each stratum: 
the value of the stratification variable, 
the number of observations (sample size), 
the total population size, and the sampling rate (fraction).

It displays the tests for significance of the model effects. 
The pocketMoney effect is strongly significant at the 5% level.

It displays the regression coefficient estimates, 
their standard errors, and the associated t tests 
for the stratified sample.

It also displays the fit plot for the regression model 
of Spending as a function of pocketMoney. 
The regression line and confidence limits of mean prediction 
are overlaid by a bubble plot of the data, 
in which the bubble area is proportional to 
the sampling weight of an observation.

Note that when ODS Graphics is enabled and 
the model contains a single continuous regressor, 
PROC SURVEYREG provides a fit plot that displays the regression line
and the confidence limits of the mean predictions.

Reference: 
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_surveyreg_gettingstarted02.htm
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_surveyreg_gettingstarted03.htm
*/

