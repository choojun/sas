proc format;
  value agelfmt (multilabel notsorted)
     11='11'
     12='12'
     13='13'
     14='14'
     15='15'
     16='16'
     11-12='11 or 12'
     13-14='13 or 14'
     15-16='15 or 16'
     low-13='13 and below'
     14-high='14 and above' ;
run;

title "GROUP Variable with MLF Option";

proc report data=sashelp.class;
   col age ('Mean' height weight);

   define age / group mlf format=agelfmt. 
   		'Age Group' order=data preloadfmt; 
   define height / mean format=6.2 'Height (in.)';
   define weight / mean format=6.2 'Weight (lbs.)';
run;