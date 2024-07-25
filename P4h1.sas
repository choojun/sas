data loan;
   balance=10000;
   do payment_number=1 to 10;
      balance=balance-1000;
      output;
   end;
run;

proc print data=loan;
run;