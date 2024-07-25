data factorial;
  number = 5;
  factorial = 1;
  do while (number > 1);
    factorial = factorial * number;
    number = number - 1;
    output;
  end;
run;

proc print data=factorial;
run;
