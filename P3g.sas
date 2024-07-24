data digits;
   keep count digits;
   length digits $20;
   string='Call [800) 5556+1234 now!';
   do until(digits=' ');
      count+1;
      *digits=scan(string, count, , 'ako');
      digits=scan(string, count, , 'dko');
      output;
   end;
run;

proc print data=digits noobs;
run;