data period_a;
  missing X I;
  input studentId $4. Foodpr1 Foodpr2 Foodpr3 Coffeem1 Coffeem2;
  datalines;
101 115 45 65 I 78
102 86 27 55 72 86
104 93 52 X 76 88
115 73 35 43 112 108
127 101 127 39 76 79
  ;

proc print data=period_a;
  title 'Results of Test Period A';
  footnote1 'X indicates TESTER ABSENT';
  footnote2 'I indicates TEST WAS INCOMPLETE';
run;