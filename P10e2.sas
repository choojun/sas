proc sgplot data=sashelp.stocks 
	(where=(date >= "01jan2000"d
		and date <= "01jan2001"d
		and stock = "IBM"));
		
   title "Stock Volume vs. Close";
   vbar date / response=volume;
   vline date / response=close y2axis;
run;