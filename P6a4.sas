data myData;  
input @1 data1 4.2 @7 data2 3.1;   
datalines;  
11.21 5.3  
3.11  11  
;  

data myData2;
set myData;

/* Comparison operators */
EQ_result = (data1 = 11.21);  
NEQ_result = (data1 ^= 11.21);  
GT_result = (data2 => 8);  
LT_result = (data2 <= 12);  
IN_result = data2 in(6.2, 5.3, 12);   
run;

proc print data=myData2;
run;