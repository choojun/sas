ods listing gpath='/home/u63487999' style=htmlblue;
ods graphics / border outputfmt=png;

data city_pop;
	length city $80;
	infile datalines dlm=',';
	state = 'NV';
	input city population;
datalines;
Fallon, 8458
Las Vegas, 623747
Minden, 3180
Elko, 20279
Goldfield, 443
Eureka, 487
Winnemucca, 7887
Battle Mountain, 3276
Pioche, 911
Yerington, 3064
Hawthorne, 3095
Tonopah, 2360
Lovelock, 1878
Virginia City, 717
Reno, 241445
Ely, 4134
Carson City, 54521
;
run;

proc geocode method=city
	data=city_pop
	out=city_pop (rename=(x=long y=lat))
	lookupcity=sashelp.zipcode; /* Use this if you don't have SAS GRAPH */
run;

data myData;
	set mapsgfk.us_counties(where=(statecode='NV'));
run;

title 'County Seat Populations';
proc sgmap mapdata=myData     /* Map boundaries */
			plotdata=city_pop /* Bubble response & location data */
			des='Nevada';
			
	openstreetmap;
	choromap / mapid=county lineattrs=(color=blue) 
		legendlabel='Counties';
		
	bubble x=long y=lat size=population /
		datalabel=city legendlabel='City Population'
		datalabelattrs=(color=darkred size=9 style=italic);
run;

ods graphics / reset;
title;