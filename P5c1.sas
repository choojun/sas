data car;
    input brand $ price;
    datalines;
Proton 49.987654
Produa 29.987654 
Audi 250.987654
Mercedes 350.987654
Toyota 89.987654
Volkswagen 109.987654
Honda 99.987654
BMW 409.987654
Lotus 799.987654
;
run;

/*
Formats is used to tell SAS how to display or write values of a variable 
whereas Informats is used to tell SAS how to read a variable.
Formats can be used in both Data Steps and PROC Steps 
whereas Informats can be used only in Data Steps.
 
Informats is basically used when you read or import data 
from either an external file (Text/Excel/CSV) or 
read in sample data which was created using CARDS/DATALINES statement. 
It is also used when you create a new variable in a dataset.

Read more from 
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/leforinforref/n0xb6ahaca5eykn1crzpqu3u30i4.htm
*/


data newCar1;
  set car;
  format price 8.2;
  keep brand price;
run;

proc print data=newCar1;
	title 'New Car Data (Try 1: Numeric informat 8.2)';
run;


data newCar2;
  set car;
  format price 4.2;
  keep brand price;
run;

proc print data=newCar2;
	title 'New Car Data (Try 2: Numeric informat 4.2)';
run;