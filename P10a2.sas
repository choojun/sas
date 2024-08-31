ods graphics on;
proc sgpanel data=sashelp.heart;
  panelby weight_status sex / layout=lattice
                              novarname;
  vbox cholesterol;
  *hbox cholesterol;
run; 
