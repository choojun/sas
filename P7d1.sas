data myTime;
   input time @@;
   datalines;
 43  90  84  87  116   95  86   99   93  92
121  71  66  98   79  102  60  112  105  98
;

/* Variable time is assumed to be normally distributed. 
The trailing at signs (@@) indicate that 
there is more than one observation on a line. 
The codes invoke PROC TTEST for a one-sample t test.
*/
ods graphics on;
proc ttest h0=80 plots(showh0) sides=u alpha=0.1;
   var time;
run;

/* The VAR statement indicates that 
the time variable is being studied, 
while the H0= option specifies that the mean of the time variable
should be compared to the null value 80 
rather than the default of 0. 

The PLOTS(SHOWH0) option requests that 
this null value be displayed on all relevant graphs. 
The SIDES=U option reflects the focus of the research question, 
namely whether the mean court case length is greater than 80 days, 
rather than different than 80 days 
(in which case you would use the default SIDES=2 option). 
The ALPHA=0.1 option requests 90% confidence intervals 
rather than the default 95% confidence intervals. 

Summary statistics appear at the top of the output. 
The sample size (N), mean, standard deviation, 
and standard error are displayed with 
the minimum and maximum values of the time variable. 
The 90% confidence limits for 
the mean and standard deviation are shown next. 

Due to the SIDES=U option, 
the interval for the mean is an upper one-sided interval 
with a finite lower bound (84.1659 days). 
The limits for the standard deviation are the equal-tailed variety, 
per the default CI=EQUAL option in the PROC TTEST statement. 
At the bottom of the output are the degrees of freedom, 
t statistic value, and p-value for the t test. 

At the 10% alpha level, this test indicates that 
the mean length of the court cases is 
significantly greater than from 80 days (t = 2.30, p = 0.0164).


It displays a histogram with overlaid normal and kernel densities, 
a box plot, the 90% confidence interval for the mean, 
and the null value of 80 days.

The confidence interval excludes the null value, 
consistent with the rejection of the null hypothesis at alpha = 0.1.

The Q-Q plot depicts assesses the normality assumption.
The curvilinear shape of the Q-Q plot suggests 
a possible slight deviation from normality. 
We could use the UNIVARIATE procedure with the NORMAL option 
to numerically check the normality assumptions.

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_ttest_gettingstarted01.htm
*/