data myData;  
input data1 $ data2 $;   
datalines;  
Hello TARUMT
Hello Buddy
;  

data myData2;
set myData;

/* Concatenation operator */
concat_result = data1 || data2;  
run;

proc print data=myData2;
run;