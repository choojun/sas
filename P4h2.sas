data earn;
   Capital=2000;
   do Year=1 to 2;
      do Month=1 to 12;
         Interest=Capital*(.075/12);
         Capital+Interest;
         output;
      end;
   end;
run;

proc print data=earn; 
run;
