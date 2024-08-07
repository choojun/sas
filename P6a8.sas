data myData;
input id x1 x_t $;
datalines;
2 3 01
3 4 010
4 5 022
5 6 021
6 7 032
;
run;

proc print data=myData;
run;

/* the COLON (:) within KEEP= option tells SAS 
to select all the variables starting with 
a specific character i.e. 'x'
*/
data myData2;
SET myData (KEEP = x:);
run;

proc print data=myData2;
run;




/* select all the observations (rows) starting 
with the specific character/s, e.g. '01'.
*/
data myData2;
SET myData;
if x_t =: '01';
run;

proc print data=myData2;
run;




/* select all the observations starting 
with the character/s, e.g. '01' or '02'.
*/
data myData2;
SET myData;
if x_t in: ('01', '02');
run;

proc print data=myData2;
run;






/* select all the cases from character/s, 
e.g. '01', up alphabetically.
*/
data myData2;
SET myData;
if x_t >: '01';
*if x_t <: '02';
run;

proc print data=myData2;
run;