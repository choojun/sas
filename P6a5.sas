data myData;  
input data1 data2 data3;   
datalines;  
11.21 5.3 0.912
3.11 11 0.123
;  

data myData2;
set myData;

/* Min/Max operators */
min_result = min(data1, data2, data3);  
max_result = max(data1, data2 , data3); 
abs_result = abs( (data1 - data2) * data3); 
round_result0 = round(data1 + 1.2345); 
round_result1 = round(data1 + 9.87654, 1); 
round_result2 = round(data1 + 1.949, 2); 
round_result10 = round(data1 + 9.876543, 10); 
run;

proc print data=myData2;
run;