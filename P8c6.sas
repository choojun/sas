proc report data=grocery;
	column sector manager (Sum Min Max Range Mean Std),sales;
   	define manager / group format=$mgrfmt.;
   	define sector / group format=$sctrfmt.;
   	define sales / format=dollar11.2;
   	title 'Sales Statistics for All Sectors';
run;