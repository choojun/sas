data myData;
input ID x1-x4;
cards;
1 . 89 85 .
2 79 . 74 .
3 80 82 86 85
;
run;

data MyData2;
set myData;
first_non_miss = coalesce(of x1-x4);
first_non_miss_word1 = coalescec('', 'Hello');
first_non_miss_word2 = coalescec('', 'Hello', 'TARUMT');
run;

/* The COALESCEC function is used to extract 
the first non-missing value from character variables. 
Whereas, the COALESCE is used for numeric variables.
*/

proc print data=MyData2;
run;

*proc sql;
*select *, coalesce(x1,x2,x3,x4) as first_non_miss from myData;
*run;


