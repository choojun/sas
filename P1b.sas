data students;
	input ID $ Name $ Age $ Major $;
	datalines;
78374 Thomas 21 .
75638 Cathy . STA
78634 David  20 ENG
	;
proc print data = students;
	title 'Students';
run;