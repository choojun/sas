*proc print data=sashelp.air;
*run;

proc timeseries data=sashelp.air
				out=series
				outtrend=trend
				outseason=season print=seasons;
	id date interval=qtr accumulate=avg;
	var air;
run;

title1 "Trend Statistics";
proc sgplot data=trend;
	series x=date y=max  / lineattrs=(pattern=solid);
	series x=date y=mean / lineattrs=(pattern=solid);
	series x=date y=min  / lineattrs=(pattern=solid);
	
	yaxis display=(nolabel);
	format date year4.;
run;


title1 "Trend Statistics for 2nd Season";
proc sgplot data=trend;
	where _season_ = 2;
	vbar date / freq=sum;
	format date year4.;
	yaxis label='Sum';
run;

data trend;
	set trend;
	year = year(date);
run;

title1 "Trend Statistics by Year";
proc sgplot data=trend;
	series x=_season_ y=mean / 
				group=year lineattrs=(pattern=solid);
	xaxis values=(1 to 4 by 1);
run;

title1 "Seasonal Statistics";
proc sgplot data=season;
	series x=_season_ y=max  / lineattrs=(pattern=solid);
	series x=_season_ y=mean / lineattrs=(pattern=solid);
	series x=_season_ y=min  / lineattrs=(pattern=solid);
	
	yaxis display=(nolabel);
	xaxis values=(1 to 4 by 1);
run;