*proc print data=sashelp.workers;
*run;


ods graphics on;
title "ODS Graphics";
proc timeseries data=sashelp.workers out=_null_
				plots=(series corr decomp)
				crossplots=all;
	id date interval=month;
	var electric;
	crossvar masonry / dif=(1);
run;