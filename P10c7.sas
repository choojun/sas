proc sgscatter data=sashelp.iris;

  title "Iris Data: Length and Width";

  compare x=(sepallength petallength)
          y=(sepalwidth petalwidth)
          	/ group=species;
run;