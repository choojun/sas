title 'Socioeconomic Variables';
data SocEcon;
   input Pop School Employ Services House;
   datalines;
5700     12.8      2500      270       25000
1000     10.9      600       10        10000
3400     8.8       1000      10        9000
3800     13.6      1700      140       25000
4000     12.8      1600      140       25000
8200     8.3       2600      60        12000
1200     11.4      400       10        16000
9100     11.5      3300      60        14000
9900     12.5      3400      180       18000
9600     13.7      3600      390       25000
9600     9.6       3300      80        12000
9400     11.4      4000      100       13000
;

/* It specifies the computation of Pearson product-moment correlations. 
The correlations range from negative 1 to 1. 
This is the default value. 
*/
proc corr noprint out=corrcorr;
run;


/* The ALPHA option computes Cronbach’s coefficient alpha 
for the analysis variables. 

Using the ALPHA option, the CORR procedure computes 
Cronbach’s coefficient alpha. It is a lower bound for 
the reliability coefficient for the raw variables 
and the standardized variables. 
      alpha >= 0.9 : Excellent
0.9 > alpha >= 0.8 : Good
0.8 > alpha >= 0.7 : Acceptable
0.7 > alpha >= 0.6 : Questionable
0.6 > alpha >= 0.5 : Poor
      alpha < 0.5  : Unacceptable
      
The standardized alpha coefficient provides information about 
how each variable reflects the reliability of the scale 
with standardized variables. 

If the standardized alpha decreases after 
removing a variable from the construct, 
then this variable is strongly correlated with other variables in the scale. 
If the standardized alpha increases after 
removing a variable from the construct, 
then removing this variable from the scale makes the construct more reliable. 
*/
*proc corr pearson alpha noprint out=corrcorr;
*run;


/* It specifies the computation of Hoeffding’s D statistics, 
scaled to range between negative 0.5 and 1. 
*/
*proc corr hoeffding noprint out=corrcorr;
*run;

/* It specifies the computation of Kendall’s tau-b coefficients 
based on the number of concordant and discordant pairs of observations. 
Kendall’s tau-b ranges from negative 1 to 1. 
*/
*proc corr kendall noprint out=corrcorr;
*run;

/* It specifies the computation of Spearman correlation coefficients 
based on the ranks of the variables. 
The correlations range from negative 1 to 1. 
*/
*proc corr spearman noprint out=corrcorr;
*run;


proc print data=corrcorr;
run;

*proc contents data=corrcorr;
*run;

