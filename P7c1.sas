data myStudent;
   input gender $ internship $ enrollment $ count @@;
   datalines;
male  yes yes 35   male  yes no 29
male   no yes 14   male   no no 27
female yes yes 32   female yes no 10
female  no yes 53   female  no no 23
;

proc freq data=myStudent order=data;
   tables internship*enrollment / chisq;
   weight count;
run;

/* PROC FREQ provides statistics for testing, 
and association in a crosstabulation table.

The variable Gender takes the values Male or Female, 
the variable internship takes the values Yes and No, 
and the variable Enrollment takes the values Yes and No. 
The variable Count contains the number of students 
that correspond to each combination of data values. 

Note that the double at sign (@@) indicates that 
more than one observation is included on a single data line. 

The ORDER option controls the order 
in which variable values are displayed in the rows and columns of the table.
By default, the values are arranged according to 
the alphanumeric order of their unformatted values. 
If you specify ORDER=DATA, 
the data are displayed in the same order 
as they occur in the input data set. 
Other options for controlling order include ORDER=FORMATTED, 
which orders according to the formatted values, 
and ORDER=FREQ, which orders by descending frequency count.

In the TABLES statement, Internship*Enrollment specifies a table 
where the rows are internship status and the columns are program enrollment. 
The CHISQ option requests chi-square statistics for 
assessing association between these two variables. 

With the input data are in cell count form, 
the WEIGHT statement is required. 
The WEIGHT statement names the variable Count, 
which provides the frequency of each combination of data values.

It also presents the crosstabulation of Internship and Enrollment. 
In each cell, the values printed under the cell count are the table percentage, 
row percentage, and column percentage, respectively. 



Part of the outputs, it also displays the statistics produced by the CHISQ option. 
The Pearson chi-square statistic is labeled 'Chi-Square' 
and has a value of 0.8189 with 1 degree of freedom. 
The associated p-value is 0.3655, 
which means that there is no significant evidence of 
an association between internship status and program enrollment. 

The other chi-square statistics have similar values 
and are asymptotically equivalent. 
The other statistics (phi coefficient, contingency coefficient, and Cramér’s V)
are measures of association derived from the Pearson chi-square. 
For Fisher’s exact test, the two-sided p-value is 0.4122, 
which also shows no association between internship status and program enrollment.

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_freq_gettingstarted01.htm
*/

