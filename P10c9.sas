proc sgpanel data=sashelp.iris;
  title "Scatter plot for Iris data";
  panelby species / columns=3;
  /*  COLUMNS specifies the number of columns in the panel */
 
  reg x=sepallength y=sepalwidth / cli clm;
  /* CLI creates individual predicted value confidence limits
  	 CLM creates mean value confidence limits */
run;