data retail;
	length store $ 10;
	format timestamp date.;

	array loc[4] $ loc1-loc4 ("Ipoh" "JB" "KL" "Penang");
	array item[8] item1-item8;

	keep store timestamp item1-item8;

	call streaminit(1);
	do i = 1 to 4;
		store = loc[i];
		timestamp = '1nov2022'd;
		do j = 1 to 100;
			dt = floor(30*rand('uniform'));
			timestamp = intnx('day',timestamp,dt);
			do k = 1 to 8;
				item[k] = rand('normal');
			end;
			output;
		end;
	end;
run;

proc print data=retail;
run;



proc timeseries data=retail out=mySeries; *print=descstats;
	by store;
	id timestamp interval=month
		/*accumulate: median average total 
		minimum maximum first last stddev */
		accumulate=stddev 
		
		setmiss=0
		/* 0: missing observations are to be treated 
		as no (zero) values */
		
		start = '01jan2022'd
		end   = '31dec2024'd;
	var item1-item8;
run;

proc print data=mySeries;
run;