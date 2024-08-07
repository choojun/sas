data myData;
input q1 q3 q4 q2 q6$ bu$ q5;
datalines;
1 2 3 5 sa an 3
2 4 3 6 sm sa 4
6 5 3 8 cb na 3
;
run; 

proc print data=myData;
	title 'Print All Data';
run;

proc print data=myData;
	var q1-numeric-q6;
	title 'Print Numeric Data';
run;

proc print data=myData;
	var q1-character-q6;
	title 'Print Character Data';
run;

proc print data=myData;
	var _character_;
	title 'Print All Character';
run;

proc print data=myData;
	var _numeric_;
	title 'Print All Numeric';
run;


data myData2;
input q1-q4 q6$ bu$ q5;
datalines;
1 2 3 5 sa an 3
2 4 3 6 sm sa 4
6 5 3 8 cb na 3
;
run; 

proc print data=myData2;
	title 'Unique way of declaring variables';
run;

/* A single dash (-) is used to specify 
consecutively numbered.
Whereas, A double dash (--) is used to specify 
variables based on the order of the variables 
as they appear in the file, 
regardless of the name of the variables. 
*/
data myData3 (drop= q1--q5);
set myData;
sum1 = sum(of q1-q4);
sum2 = sum(of q1--q4);
sum3 = sum(of _numeric_);
sum4 = sum(of q:);
run;

proc print data=myData3;
	title 'Various kind of SUM'
run;
