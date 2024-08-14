title1 'Nitrogen Content of Red Clover Plants';
data Clover;
   input Strain $ Nitrogen @@;
   datalines;
3DOK1  19.4 3DOK1  32.6 3DOK1  27.0 3DOK1  32.1 3DOK1  33.0
3DOK5  17.7 3DOK5  24.8 3DOK5  27.9 3DOK5  25.2 3DOK5  24.3
3DOK4  17.0 3DOK4  19.4 3DOK4   9.1 3DOK4  11.9 3DOK4  15.8
3DOK7  20.7 3DOK7  21.0 3DOK7  20.5 3DOK7  18.8 3DOK7  18.6
3DOK13 14.3 3DOK13 14.4 3DOK13 11.8 3DOK13 11.6 3DOK13 14.2
COMPOS 17.3 COMPOS 19.4 COMPOS 19.1 COMPOS 16.9 COMPOS 20.8
;

ods graphics on;
proc anova data = Clover;
   class Strain;
   model Nitrogen = Strain;
   means Strain / tukey;
run;

/* The classification variable is specified in the CLASS statement. 
PROC ANOVA does not allow continuous variables 
on the right-hand side of the model. 

The overall F test is significant (F = 14.37, p < 0.0001), 
indicating that the model as a whole accounts 
for a significant portion of the variability in the dependent variable. 
The F test for Strain is significant, 
indicating that some contrast between the means 
for the different strains is different from zero. 
Notice that the Model and Strain F tests are identical, 
since Strain is the only term in the model.

The significant F test for Strain suggests that 
there are differences among the bacterial strains, 
but it does not reveal any information about the nature of the differences. 
You can use mean comparison methods to gather further information. 
The MEANS statement requests comparisons of the means of the Strain levels 
by using Tukey’s studentized range method.

Reference: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/statug/statug_anova_gettingstarted01.htm
*/