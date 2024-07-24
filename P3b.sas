data have;
	infile datalines dsd missover;
	input var :$100.;
	datalines;
xxxxx >> xxxx >> x
xx >> xxxx >> xxxxxxxx
xxxx >> xxx >> xxxxxxxxxxxxxxxxx
;
run;

data want;
	set have;
	want = strip(scan(var, -1, '>>'));
run;

PROC PRINT data = want;
RUN;