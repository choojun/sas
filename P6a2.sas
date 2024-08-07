data myData;  
input @1 data1 4.2 @7 data2 3.1;  
datalines;  
11.21 5.3  
3.11  11
3.12  12
34.11 22
5.11 3.22
5.12 3.23
;  

data myData2;
set myData;

/* Arithmetic operators */
add_result = data1 + data2;  
sub_result = data1 - data2;  
mult_result = data1 * data2;  
div_result = data1 / data2;  
expo_result = data1 ** data2;  
mean_result = add_result / 2;  
watchout_result = data1 + data2 * 2; 
run;

proc print data=myData2;
run;

proc means data = myData Mean SUM MAXDEC=2;   
run;  

proc means data = myData Mean SUM MAXDEC=0;   
run;  

proc means data = myData Mean SUM MAXDEC=2;
	var data2;
run; 