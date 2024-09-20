proc iml;
/* Item:  1 2 3 4 5   6   7   8   9  10  11  12  13  14  15  16  17 */
weight = {2 3 4 4 1.5 1.5 1   1   1   1   1   1   1   1   1   1   1};
Value  = {6 6 6 5 3.1 3.0 1.5 1.3 1.2 1.1 1.0 1.1 1.0 1.0 0.9 0.8 0.6};
WtLimit = 9;                                 /* weight limit */
 
rowsense = "L";                              /* L = 'less than or equal' */
cntl = -1;                                   /* maximize the objective */
call milpsolve(rc, MaxValue, b, relgap,      /* output args */
               Value, Weight, WtLimit)       /* required input args */
               CNTL=cntl ROWSENSE=rowsense;  /* optional args */
/* Check the weight of the solution. Print the max value and the solution vector */
MaxWeight = Weight*b;
print MaxValue MaxWeight, /* MaxValue  = Value*b */
      (b`)[L="Solution Vector" c=(1:nrow(b))];
      
      
      
/* print weights and values for the selected items */
Items = T( loc(b) );            /* select items where b=1 */
Values = Value[Items];          /* values of selected items */
Weights = Weight[Items];        /* weights of selected items */
print Items Values Weights;

/* Adapted from: https://blogs.sas.com/content/iml/2021/10/11/knapsack-problem.html
*/
