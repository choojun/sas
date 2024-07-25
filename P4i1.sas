data testLoop;
  x = 1;
  do while (x <= 5);
    y = x * 2;
    x = x + 1;
    output;
  end;
run;

proc print data=testLoop;
run;