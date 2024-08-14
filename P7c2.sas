data myStudent;
   input gender $ internship $ enrollment $ count @@;
   datalines;
male  yes yes 35   male  yes no 29
male   no yes 14   male   no no 27
female yes yes 32   female yes no 10
female  no yes 53   female  no no 23
;

*ODS Graphics must be enabled before producing plots. 
The PLOTS(ONLY)=FREQPLOT option requests frequency plots. 
The TWOWAY=CLUSTER plot-option specifies a cluster layout 
for the two-way frequency plots.;
ods graphics on;
proc freq data=myStudent;
   tables gender*internship*enrollment /chisq 
   		cmh plots(only)=freqplot(twoway=cluster);
   weight Count;
run;

/* It displays the frequency plot of Internship by Enrollment for male and female. 
By default, frequency plots are displayed as bar charts. 
You can use PLOTS= options to request dot plots instead of bar charts, 
to change the orientation of the bars from vertical to horizontal, 
and to change the scale from frequencies to percents. 
You can also use PLOTS= options to specify other two-way layouts 
(stacked, vertical groups, or horizontal groups) 
and to change the primary grouping from column levels to row levels.

These individual table results demonstrate the occasional problems 
with combining information into one table 
and not accounting for information in other variables such as Gender. 
It contains the CMH results. There are three summary (CMH) statistics; 
which one you use depends on whether your rows and/or columns 
have an order in r x c tables. However, in the case of 2 x 2 tables, 
ordering does not matter and all three statistics take the same value. 

The CMH statistic follows the chi-square distribution 
under the hypothesis of no association, 
and here, it takes the value 4.0186 with 1 degree of freedom. 
The associated p-value is 0.0450, 
which indicates a significant association at the alpha = 0.05 level.

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_freq_gettingstarted01.htm
*/