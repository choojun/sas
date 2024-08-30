data choojun_students;
	input ID $ Name $ AmtPaid Course $ New;
	datalines;
78374 Adam  	350.00 597 1
75638 Michele 	525.00 221 1
78634 Jacob 	625.00 221 0
28746 . 	. 	597 2
58743 Zina 	250.00 435 0
45378 Amy 	250.00 435 0
87463 Angela 	525.00 221 1
46732 Trevor 	450.00 597 0
23867 Michael 	450.00 597 0
78374 Adam 350.00 597 1
75638 Michele 525.00 221 1
78634 Jacob 625.00 221 0
28746 . . 597 2
58743 Zina 250.00 435 0
45378 Amy 250.00 435 0
87463 Angela 525.00 221 1
46732 Trevor 450.00 597 0
23867 Michael 450.00 597 0
;
run;

proc print data = choojun_students;
	title "My Students"
run;
