data fishData;
   infile datalines missover;
   input Location & $15. Date date7.
         Length1 Weight1 Length2 Weight2 Length3 Weight3
         Length4 Weight4;
   format date date7.;
   datalines;
Gelugor Lake   2JUN95 31 .25 32 .3  32 .25 33 .3
Gelugor Lake   3JUL95 33 .32 34 .41 37 .48 32 .28
Gelugor Lake   4AUG95 29 .23 30 .25 34 .47 32 .3
Kenyir Lake  2JUN95 32 .35 32 .25 33 .30
Kenyir Lake  3JUL95 30 .20 36 .45
Kenyir Lake  4AUG95 33 .30 33 .28 34 .42
;

proc transpose data=fishData
	out=fishlength(rename=(col1=Measurement));
   	var length1-length4;
   	by location date;
run;

proc print data=fishlength noobs;
   title 'Fish Length Data for Each Location and Date';
run;