data do_to;
   t2=0;
   do t1=0 to 10;
      t2=t2+1;
      output;
   end;
run;

proc print data=do_to;
run;