proc sgscatter data=sashelp.iris
	(where=(species="Virginica"));
  	
  	title "Multi-Celled Spline Curve for Species Virginica";
  	plot (sepallength sepalwidth)*(petallength petalwidth)
       / pbspline;
run;
