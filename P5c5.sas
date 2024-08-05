data car;
    input model $ price;
    datalines;
Savvy 29.987654
Saga 39.987654
Iriz 45.987654
Waja 49.987654 
Gen2 55.987654 
Persona 49.987654
S70 79.987654
X50 89.987654
X70 99.987654
X90 129.987654
;
run;

data newCar2;
  	set car;
    *FORMAT mfg time.;      /* 22:25:33 */
    *FORMAT mfg timeampm3.; /* PM */
    *FORMAT mfg timeampm5.; /* 10 PM */ 
    *FORMAT mfg timeampm8.; /* 10:25 PM */ 
    *FORMAT mfg timeampm11.;/* 10:25:33 PM */ 
   
	if model = 'Savvy' then mfg = '15:34:27't;
    else if model = 'Saga' then mfg = '15:34:27't;
    else if model = 'Iriz' then mfg = '15:34:27't;
    else if model = 'Waja' then mfg = '15:34:27't;
    else if model = 'Gen2' then mfg = '15:34:27't;
    else if model = 'Persona' then mfg = '15:34:27't;
    else if model = 'S70' then mfg = '15:34:27't;
    else if model = 'X50' then mfg = '15:34:27't;
    else if model = 'X70' then mfg = '15:34:27't;
    else if model = 'X90' then mfg = '15:34:27't;
    else mfg = '15:34:27't;
run;

proc print data=newCar2;
	title 'New Car Data';
run;

