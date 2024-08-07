proc sort data = sashelp.class out=class;
by name sex;
run;

proc print data = class; 
	title 'Class';
run;

proc transpose data = sashelp.class out=temp;
by name sex;
var height;
run;

proc print data = class; 
	title 'Temp';
run;

/* The double transposes dataset is used 
to generate separate variables of height 
for both males and females and then 
selects them in an array using a wildcard.
*/
proc transpose data = temp DELIMITER=_ out=temp2(drop=_name_);
by name;
var col1;
id _name_ sex;
run;

proc print data = temp2; 
	title 'Temp2';
run;


proc sql noprint;
select CATS('new_',name) into: newnames separated by " "
from dictionary.columns
where libname = "WORK" and memname = "TEMP2" 
  and name like "Height_%";
quit;


data myData;
set temp2;

array h(*) height:;
array newh(*) &newnames.;

do i = 1 to dim(h);
newh{i} = h{i}*2;
end;

drop i;
run;

proc print data = myData; 
	title 'myData';
run;
