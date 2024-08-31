proc sgscatter data=sashelp.iris;
  title "Scatterplot Matrix for Iris";
  matrix sepallength petallength sepalwidth petalwidth
         / group=species;
run;
title;