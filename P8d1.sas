data grocmiss;
   input Sector $ Manager $ Department $ Sales @@;
   format Sector Manager Department Sales;
   datalines;
se 1 np1 50    .  1 p1 100   se . np2 120   se 1 p2 80
se 2 np1 40    se 2 p1 300   se 2 np2 220   se 2 p2 70
nw 3 np1 60    nw 3 p1 600   .  3 np2 420   nw 3 p2 30
nw 4 np1 45    nw 4 p1 250   nw 4 np2 230   nw 4 p2 73
nw 9 np1 45    nw 9 p1 205   nw 9 np2 420   nw 9 p2 76
sw 5 np1 53    sw 5 p1 130   sw 5 np2 120   sw 5 p2 50
.  . np1 40    sw 6 p1 350   sw 6 np2 225   sw 6 p2 80
ne 7 np1 90    ne . p1 190   ne 7 np2 420   ne 7 p2 86
ne 8 np1 200   ne 8 p1 300   ne 8 np2 420   ne 8 p2 125
;

proc format;
   value $sctrfmt 'se' = 'Southeast'
                  'ne' = 'Northeast'
                  'nw' = 'Northwest'
                  'sw' = 'Southwest';
   value $mgrfmt '1' = 'Samy'   '2' = 'John'
                 '3' = 'Ruby'  '4' = 'Baba'
                 '5' = 'Taha'  '6' = 'Ahmad'
                 '7' = 'Ali'  '8' = 'Abu'
                 '9' = 'Phang';
   value $deptfmt 'np1' = 'Stationery'
                  'np2' = 'Canned'
                  'p1'  = 'Apparel'
                  'p2'  = 'Pharmacy';
run;

proc report data=grocmiss;
   column sector manager N sales;
   define sector / group format=$sctrfmt.;
   define manager / group format=$mgrfmt.;
   define sales / format=dollar9.2;
   
   rbreak after / summarize style=[fontstyle=italic];
   title 'Summary Report for All Sectors and Managers';
run;