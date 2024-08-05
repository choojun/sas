data new;
   input x;
   if x=1 then y=999;
   datalines;
      4
      1
      3
      1
;
run;

proc print data=new;
run;