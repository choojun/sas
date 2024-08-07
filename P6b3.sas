data myData;
v1=49; v2=59; v3=29; v4=39; v5=69;  

max_value = MAX(v1, v2, v3, v4, v5);  
min_value = MIN(v1, v2, v3, v4, v5);  
med_value = MEDIAN(v1, v2, v3, v4, v5);  
random_value = RANUNI(1);  
SquareRoot_value= SQRT(sum(v1, v2, v3, v4, v5));  
run;

proc print data=myData;
run;