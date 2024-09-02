ods graphics on;
proc sgpanel data=sashelp.heart;
  title "Cholesterol Distribution in Heart Study";
  panelby sex;
  histogram cholesterol;
  density cholesterol;
run; 