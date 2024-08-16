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

/* Regression analysis.
Read more at https://en.wikipedia.org/wiki/Regression_analysis

The TOTAL=4000 option specifies the total in the population from 
which the sample is drawn. 

The CLASS statement requests that the procedure use 
the variable Students as a classification variable in the analysis. 

The MODEL statement describes the linear model that 
you want to fit, with Spending as the dependent variable and 
pocketMoney and Students as the independent variables. 

The SOLUTION option in the MODEL statement requests that 
the procedure output the regression coefficient estimates.
*/
title1 'Lunch Spending Analysis';
title2 'using Simple Random Sample Design';
proc surveyreg data=lunch total=4000;
   class Students;
   model spending = pocketMoney Students / solution;
run;

/* Output:
It displays the summary of the data, the summary of the fit, 
and the levels of the classification variable Students. 
The "Fit Statistics" table displays the denominator degrees of freedom, 
which are used in F tests and t tests in the regression analysis.

It also displays the tests for model effects. 
The effect Income is significant in the linear regression model, 
while the effect Students is not significant at the 5% level.

The regression coefficient estimates and 
their standard errors and associated t tests are displayed too!

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_surveyreg_gettingstarted01.htm
*/