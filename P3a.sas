data have;
	length str $18;
	input str;
	datalines;
121121121121121
121556121112141215
;
run;

data want;
	set have;
	count=count(str,'121');
run;

PROC PRINT data = want;
RUN;