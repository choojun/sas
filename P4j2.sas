data mydata;
  input var1 var2 var3 var4;
  datalines;
  1 2 3 24
  5 6 37 8
  8 7 86 5
  9 100 199 2
  ;
run;

data max_values;
  set mydata;
  array vars[*] var1-var4;
  max_value = vars[1];
  
  do i = 2 to dim(vars);
    if vars[i] > max_value then max_value = vars[i];
  end;
run;

proc print data=max_values;
run;
