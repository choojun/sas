data myScores;
   input Gender $ Score @@;
   datalines;
f 75  f 76  f 80  f 77  f 80  f 77  f 73
m 82  m 80  m 85  m 85  m 78  m 87  m 82
;

/* It is used to compare values obtained from two different groups.

Note that if the groups are independent of each other and 
the data are normally or lognormally distributed in each group, 
then a group t test can be used.
*/

ods graphics on;
proc ttest cochran ci=equal umpu alpha=0.1;
   class Gender;
   var Score;
run;

/* We can use a group t test to determine 
whether the mean golf score for the men in the class 
differs significantly from the mean score for the women. 

If we also suspect that 
the distributions of the golf scores of males 
and females have unequal variances, 
then we might want to specify the COCHRAN option 
in order to use the Cochran approximation 
(in addition to the Satterthwaite approximation, 
which is included by default). 

It invokes PROC TTEST for the case of unequal variances, 
along with both types of confidence limits 
for the pooled standard deviation.


The CLASS statement contains the variable 
that distinguishes the groups being compared, 
and the VAR statement specifies the response variable 
to be used in calculations. 

The COCHRAN option produces p-values 
for the unequal variance situation 
by using the Cochran and Cox (1950) approximation. 
Equal-tailed and uniformly most powerful unbiased (UMPU) 
confidence intervals for alpha are requested by the CI= option. 
 

The Gender column indicates the population that 
corresponds to the statistics in that row, 
and the Method column indicates the method 
for estimating the standard deviation, 
either pooled (assuming equal variances for males and females) 
or Satterthwaite (assuming unequal variances). 
The sample size (N), mean, standard deviation, standard error, 
and minimum and maximum values are displayed.

The test statistics, associated degrees of freedom, 
and p-values are displayed as the result.

The Method column denotes which t test is being used for that row, 
and the Variances column indicates what assumption about variances is being made. 
The pooled test assumes that the two populations have equal variances 
and uses degrees of freedom n1+n2-2, 
where n1 and n2 are the sample sizes for the two populations. 
The remaining two tests do not assume that 
the populations have equal variances. 
The Satterthwaite test uses the Satterthwaite approximation 
for degrees of freedom, 
while the Cochran test uses the Cochran and Cox approximation 
for the p-value. 
All three tests result in highly significant p-values, 
supporting the conclusion of a significant difference 
between males’ and females’ golf scores.

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_ttest_gettingstarted02.htm
*/