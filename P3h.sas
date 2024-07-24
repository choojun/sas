data firstlast;
   input String $60.;
   First_Word=scan(string, 1);
   First_Word2=scan(string, 1, , 'ako');
   Last_Word=scan(string, -1);
   datalines4;
Jack and Jill
Jack2 and Jill
& Bob & Carol & Ted & Alice &
& Bob2 & Carol & Ted & Alice &
leonardo
leonardo2
! $ % & ( ) * + , - . / ;
;;;;

proc print data=firstlast;
run;