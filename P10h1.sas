data myData;
    input attrition 1-2 yearOfExperience 3-4 annualSalary;
    label attrition='Employee Attrition';
    datalines;
0	9	98217
1	5	53477
1	2	22447
1	2	21458
0	2	25990
0	10	106338
1	6	67279
0	4	46575
1	8	83782
0	7	76975
0	4	48110
1	7	74134
1	8	87071
1	9	94795
0	1	16762
0	7	74261
0	8	88497
1	9	92901
0	7	76878
0	9	94273
1	8	87021
;
run;

proc means data=myData NMISS N;
run;

proc logistic data=myData descending plots(only)=roc;
  model attrition = yearOfExperience annualSalary;
run;

/* If AUC is closer to 1, it means it's a good model. 
If AUC is equal to 0.5, it means random guessing and model is of useless.
*/



*proc logistic data=myData desc;
*model attrition = yearOfExperience annualSalary /outroc = rocdata ;
*run;

*proc gplot data=rocData;
*symbol1 i=join v = none c=red line=1;
*plot _sensit_ * _1mspec_;
*run;

/* It stores Sensitivity and (1-Specificity) scores in a new dataset 
using the OUTROC option in PROC LOGISTIC. 
Then it plots them using the PROC GPLOT procedure.
*/