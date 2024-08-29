data score;
   input Student $ StudentID $ Section $ Test1 Test2 Final;
   datalines;
Ali 	0545 1  94 91 87
Baba    1252 2  51 65 91
Chong 	1167 1  95 97 97
Emily 	1230 2  63 75 80
Fraud 	2527 2  80 76 71
Gopal 	4860 1  92 40 86
Halim 	0674 1  75 78 72
;

proc print data=score noobs;
run;

proc transpose data=score out=idlabel name=Test
	prefix=sn;
	id studentid;
	idlabel student;
run;

proc print data=idlabel label noobs;
	title 'Student Test Scores';
run;
  
*proc contents data=idlabel;
*run;
