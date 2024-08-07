data myData;  
input @1 data1 4.2 @7 data2 3.1;   
datalines;  
11.21 5.3  
3.11  11  
;  

data myData2;
set myData;

/* Logical operators */
and_result = (data1 > 10 & data2 > 5);  
or_result = (data1 > 12 | data2 > 15);  
not_result = ~(data2 > 7 );   
run;

proc print data=myData2;
run;