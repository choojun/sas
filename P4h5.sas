data brute_force;
  do x = 0 to 5 by 0.01;
    y = -x*x + 4*x;
    output;
  end;
run;

proc print data=brute_force;
run;
