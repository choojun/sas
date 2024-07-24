data firstlast;
   input String $60.;
   First_Word=scan(string, 1);
   Last_Word=scan(string, -1);
   datalines4;
Jack and Jill
& Bob & Carol & Ted & Alice &
leonardo
! $ % & ( ) * + , - . / ;
;;;;

proc print data=firstlast;
run;