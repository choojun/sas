data new_employee_info;
set employee_info;
set employee_serial;
run;


proc print data=new_employee_info;
   title 'Little Theater Employee Information with Serial Number';
run;