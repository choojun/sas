proc print data=employee_info;
   title 'Little Theater Employee Information';
   title2 '(including personal and financial information)';
run;

data employee_serial;
do counter = 1 to 8;
   output;
end;
run;


proc print data=employee_serial;
   title 'Employee Serial Number';
run;