proc sgpanel data=sashelp.prdsale;
  where product in ("CHAIR" "SOFA");
  title "Yearly Sales by Product";
  panelby year / spacing=5 novarname;
  
  vline month / response=actual group=product;
run;