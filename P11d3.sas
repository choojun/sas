proc sql;
create table myCars as
SELECT make, model, type, invoice, horsepower, length, weight
FROM 
SASHELP.CARS
WHERE make in ('Audi','BMW')
;
run;

TITLE 'Scatterplot - Two Variables';
proc sgscatter  data = myCars;
   PLOT horsepower*Invoice 
   / datalabel = make group = type grid;
   title 'Horsepower vs. Invoice for car makers by types';
RUN; 