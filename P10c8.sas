proc sgscatter data=sashelp.iris
	(where=(species="Versicolor"));
  
	title "Versicolor Length and Width";
	compare y=(sepalwidth petalwidth)
			x=(sepallength petallength)
				/ reg ellipse=(type=mean) spacing=4;
run;