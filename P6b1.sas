data myData;  
Lowcse_result = LOWCASE('HELLO TARUMT');  
Upcase_result = UPCASE('hello tarumt');  
Capitalize_Each_Word_result= PROPCASE('hello tarumt');  
Reverse_result = REVERSE('Hello');  
Scan_Targeted_Letter = SCAN('Hello Tarumt',1);  
;  

proc print data=myData;
run;