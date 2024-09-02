data Data1;
   input disease n age;
   datalines;
 0 14 25
 0 20 35
 0 19 45
 7 18 55
 6 12 65
17 17 75
;

ods graphics on;
%let _ROC_XAXISOPTS_LABEL=False Positive Fraction;
%let _ROC_YAXISOPTS_LABEL=True Positive Fraction;
proc logistic data=Data1 plots(only)=roc(id=obs);
   model disease/n=age / scale=none
                         clparm=wald
                         clodds=pl
                         rsquare;
                         
   units age=10;
   effectplot;
run;

/*
It also estimates a customized odds ratio, 
produces the traditional goodness-of-fit analysis, 
displays the generalized R-square measures for the fitted model, 
calculates the normal confidence intervals for the regression parameters, 
and produces a display of the probability function 
and prediction curves for the fitted model.

SCALE=NONE is specified to produce the deviance 
and Pearson goodness-of-fit analysis without adjusting for overdispersion.

RSQUARE option is specified to produce generalized R-square 
measures of the fitted model. 

CLPARM=WALD option is specified to produce the Wald confidence intervals 
for the regression parameters. 

UNITS statement is specified to produce customized odds ratio estimates 
for a change of 10 years in the age variable.

CLODDS=PL option is specified to produce profile-likelihood 
confidence limits for the odds ratio. 

PLOTS= option with ODS Graphics enabled produces 
a graphical display of the ROC curve with certain points labeled 
with their ID values, 
the two macro variables modify the ROC axis labels.

EFFECTPLOT statement displays the model fit.
*/