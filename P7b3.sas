proc SQL;
create table myCars as
SELECT invoice, horsepower, length, weight
   FROM 
   SASHELP.CARS
   WHERE make in ('Audi','BMW')
;
run;

proc surveyreg data=myCars;
   model horsepower = weight ;
   ods output ParameterEstimates = MyParamEstim;
run;

proc print data=MyParamEstim;
run;