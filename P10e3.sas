proc sgpanel data=sashelp.prdsale;
  title "Yearly Sales by Product";
  panelby year / novarname columns=1;
  
  hbar product / response=actual;
run;