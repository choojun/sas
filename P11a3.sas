ods listing gpath='/home/u63487999' style=htmlblue;
ods graphics / border imagefmt=png;

data katrina;
	format datetime datetime18.;
	informat datetime datetime18.;
	infile datalines dlm=',';
	input datetime lat long wind;
	datestring=substr(put(datepart(datetime),date9.),1,5);
datalines;
23AUG2024:18:00:00,23.1,-75.1,30
24AUG2024:06:00:00,23.8,-76.2,30
25AUG2024:06:00:00,26.1,-78.4,50
26AUG2024:06:00:00,25.4,-81.3,65
27AUG2024:06:00:00,24.4,-84,95
28AUG2024:06:00:00,25.2,-86.7,125
29AUG2024:06:00:00,28.2,-89.6,125
30AUG2024:06:00:00,34.1,-88.6,40
31AUG2024:06:00:00,40.1,-82.9,25
;
run;

title1 'Hurricane (2024)';
proc sgmap plotdata=katrina;
	openstreetmap;
	series x=long y=lat / 
		lineattrs=(color=red thickness=2)
		legendlabel='Storm Track';
	bubble x=long y=lat size=wind /
		datalabel=datestring datalabelpos=left
		datalabelattrs=(color=red size=10)
		legendlabel='Relative Wind Speed';
run;

ods graphics / reset;
title;