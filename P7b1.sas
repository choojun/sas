proc print data=sashelp.class;
run;

/* We use regression analysis to find out 
how well we can predict a child’s weight if you know that child’s height. 
The Class data set used in this example is available in the Sashelp library.
*/
proc reg data=sashelp.class;
   model Weight = Height;
run;

/* The F statistic for the overall model is 
highly significant (F = 57.076, p < 0.0001), 
indicating that the model explains a significant portion of 
the variation in the data.

The degrees of freedom can be used in checking accuracy of the data and model. 
The model degrees of freedom are one less than 
the number of parameters to be estimated. 
This model estimates two parameters, beta 0 and beta 1; 
thus, the degrees of freedom should be 2 – 1 = 1. 
The corrected total degrees of freedom are always one less than 
the total number of observations in the data set, in this case 19 – 1 = 18.

The Root MSE is an estimate of the standard deviation of the error term. 
The coefficient of variation, or Coeff Var, 
is a unitless expression of the variation in the data. 
The R-square and Adj R-square are two statistics used 
in assessing the fit of the model; 
values close to 1 indicate a better fit. 
The R-square of 0.77 indicates that Height accounts for 
77% of the variation in Weight.

The "Parameter Estimates" table contains the estimates of beta 0 and beta 1. 
The table also contains the t statistics and 
the corresponding p-values for testing whether 
each parameter is significantly different from zero. 
The p-values (t = –4.43, p = 0.0004 and t = 7.55, p < 0.0001) 
indicate that the intercept and Height parameter estimates, respectively, 
are highly significant.

From the parameter estimates, the fitted model is
Weight = -143.0 + 3.9 X Height

PROC REG also produces a variety of plots. 
It shows a plot of the residuals versus the regressor and 
it also shows a panel of diagnostic plots.

A trend in the residuals would indicate nonconstant variance in the data. 
The plot of residuals by predicted values in 
the upper-left corner of the diagnostics panel might 
indicate a slight trend in the residuals; 
they appear to increase slightly as the predicted values increase. 
A fan-shaped trend might indicate the need for 
a variance-stabilizing transformation. 
A curved trend (such as a semicircle) might indicate the need 
for a quadratic term in the model. 
Since these residuals have no apparent trend, 
the analysis is considered to be acceptable.

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_reg_gettingstarted01.htm
*/
