proc SQL;
create table myCar as
SELECT invoice, horsepower, length, weight
   FROM 
   sashelp.cars
   WHERE make in ('Audi','BMW')
;
RUN;

proc corr pearson alpha data=myCar plots=matrix;
*VAR horsepower weight ;
run;
