data TotalScores;
   title 'High School Scores Data';
   input id Type $ total @@;
   datalines;
 1 rural 135   2 rural 125   3 rural 223   4 rural 224   5 rural 133
 6 rural 253   7 rural 144   8 rural 193   9 rural 152  10 rural 178
11 rural 120  12 rural 180  13 rural 154  14 rural 184  15 rural 187
16 rural 111  17 rural 190  18 rural 128  19 rural 110  20 rural 217
21 urban 192  22 urban 186  23 urban  64  24 urban 159  25 urban 133
26 urban 163  27 urban 130  28 urban 163  29 urban 189  30 urban 144
31 urban 154  32 urban 198  33 urban 150  34 urban 151  35 urban 152
36 urban 151  37 urban 127  38 urban 167  39 urban 170  40 urban 123
;

ods graphics on;
proc boxplot data=TotalScores;
   plot total*Type / boxstyle=schematic noserifs;
run;
