data carPrice;
     INPUT @6 mfgDate ddmmyy8. @15 mfgDate2 ddmmyy10.;
     FORMAT mfgDate ddmmyy8. mfgDate2 ddmmyy10.;
datalines;
     30-12-24 30-12-2024
  ;
run;

proc print data=carPrice;
	title 'Result of carPrice (Original)';
run;

data carPrice2;
     INPUT mfgDate ddmmyy8. @10 mfgDate2 ddmmyy10.;
     FORMAT mfgDate ddmmyy8. mfgDate2 ddmmyy10.;
datalines;
30-12-24 30-12-2024
  ;
run;

proc print data=carPrice2;
title 'Result of carPrice2 (with format)';
run;

data carPrice3;
     INPUT mfgDate ddmmyy8. @10 mfgDate2 ddmmyy10.;
datalines;
30-12-24 30-12-2024
  ;
run;

proc print data=carPrice3;
	title 'Result of carPrice3 (without format)';
run;
