data SkinCondition;
   input Derm1 $ Derm2 $ Count;
   datalines;
terrible terrible 10
terrible     poor 4
terrible marginal 1
terrible    clear 0
poor     terrible 5
poor         poor 10
poor     marginal 12
poor        clear 2
marginal terrible 2
marginal     poor 4
marginal marginal 12
marginal    clear 5
clear    terrible 0
clear        poor 2
clear    marginal 6
clear       clear 13
;

ods graphics on;
proc freq data=SkinCondition order=data;
   tables Derm1*Derm2 /
          agree noprint plots=agreeplot;
   test kappa;
   weight Count;
run;
ods graphics off;



/* It is used to evaluate the agreement of the diagnoses 
(a possible contribution to measurement error in the study), 
the kappa coefficient is computed. 

The TABLES statement requests a crosstabulation of 
the variables Derm1 and Derm2. 
The AGREE option in the TABLES statement requests the kappa coefficient, 
together with its standard error and confidence limits. 
The KAPPA option in the TEST statement requests a test for 
the null hypothesis that kappa is 0, 
which indicates that the agreement is purely by chance. 
The NOPRINT option in the TABLES statement suppresses 
the display of the two-way table. 
The PLOTS= option requests an agreement plot for the two dermatologists. 

The kappa coefficient has the value 0.3449, 
which indicates some agreement between the dermatologists, 
and the hypothesis test confirms 
that we can reject the null hypothesis of no agreement. 
This conclusion is further supported by the confidence interval of (0.2030, 0.4868), 
which suggests that the true kappa is greater than 0. 
The AGREE option also produces Bowker’s symmetry test 
and the weighted kappa coefficient, 
but that output is not shown here. 
It also displays the agreement plot for the ratings of the two dermatologists. 

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_freq_gettingstarted02.htm
*/