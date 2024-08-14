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
run;


proc sgscatter data = myCars; 
compare y=Invoice  x=(horsepower length)  
         / group = type  ellipse =(alpha = 0.05 type = predicted); 
         
title 'Average Invoice vs. horsepower for cars by length'; 
title2 '-- with 95% prediction ellipse --'; 
format Invoice dollar6.0;
run; 


proc sgscatter  DATA = CARS1;
   matrix horsepower invoice length / group = type;
   title 'Horsepower vs. Invoice vs. Length for car makers by types';
run; 