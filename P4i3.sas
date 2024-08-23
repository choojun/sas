data myData;
  do until (number > 8);
    output;
    number + 1;
  end;
run;

proc print data=myData;
run;
