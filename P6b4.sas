data myData;
/* Nearest greatest integer */  
ceil_result = CEIL(19.85);  
  
/* Nearest smallest integer */  
floor_result = FLOOR(19.85);  
  
/* Integer portion of a number */  
int_result = INT(25.41);  
  
/* Round off to nearest value */  
round_result = ROUND(8888.68); 

abs_result = ABS(-8888.68); 

/* Special: geographic code for U.S. territories */  
state2=zipstate('27511');  

/* 
Amortization is an accounting technique used 
to periodically lower the book value of a loan or 
an intangible asset over a set period of time. 

Special - Amortization calculation : MORT(a,p,r,n)
a: It is a numeric value which specifies the initial amount.
p: It is a numeric value which specifies the periodic payment.
r: It is a numeric value which specifies the periodic interest rate, 
   which is expressed as a fraction.
n: It is an integer value which specifies the number of compounding periods.
*/  
payment = mort(10000, . , .10/12,30*12);  
run;

proc print data=myData;
run;