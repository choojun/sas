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

proc report data=grocery;
   column sector manager department sales;
   rbreak after / summarize style=[font_weight=bold];
   
   where sector='se';
   format sector $sctrfmt. manager $mgrfmt. department $deptfmt.
          sales dollar11.2;
          
   title 'Sales for the Southeast Sector';
   *title2 "for &sysdate";
run;
