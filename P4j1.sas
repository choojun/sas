data mydata;
  input var1 var2 var3 var4;
  datalines;
  1 2 3 4
  5 6 7 8
  ;
run;

data sum_data;
  set mydata;
  array vars[*] var1-var4;
  sum_value = 0;
  
  do i = 1 to dim(vars);
    sum_value = sum_value + vars[i];
  end;
run;

proc print data=sum_data;
run;
