data car;
    input brand $ price;
    datalines;
Proton 49.987654
Produa 29.987654 
Audi 250.987654
Mercedes 350.987654
Toyota 89.987654
Volkswagen 109.987654
Honda 99.987654
BMW 409.987654
Lotus 799.987654
;
run;

data newCar2;
  	set car;
    *FORMAT mfg datetime.;    /* 31DEC24:22:25:33 */
    *FORMAT mfg datetime7.;   /* 31DEC24 */
    *FORMAT mfg datetime12.;  /*  31DEC24:22 */ 
    *FORMAT mfg datetime18.;  /*  31DEC24:22:25:33 */ 
    *FORMAT mfg datetime18.1; /* 31DEC24:22:25:33.0 */ 
    *FORMAT mfg datetime19.;  /*  31DEC2024:22:25:33 */ 
    *FORMAT mfg datetime20.1; /* 31DEC2024:22:25:33.0 */ 
    *FORMAT mfg datetime21.2; /* 31DEC2024:22:25:33.00 */ 
   
	if brand = 'Proton' then mfg = '26JUN2015:-1:34:27'dt;
    else if brand = 'Produa' then mfg = '26JUL2016:-1:34:27'dt;
    else if brand = 'Audi' then mfg = '26JUL2017:-1:34:27'dt;
    else if brand = 'Mercedes' then mfg = '26JUL2018:-1:34:27'dt;
    else if brand = 'Toyota' then mfg = '26JUL2019:-1:34:27'dt;
    else if brand = 'Volkswagen' then mfg = '26JUL2020:-1:34:27'dt;
    else if brand = 'Honda' then mfg = '26JUL2021:-1:34:27'dt;
    else if brand = 'BMW' then mfg = '26JUL2022:-1:34:27'dt;
    else if brand = 'Lotus' then mfg = '26JUL2023:-1:34:27'dt;
    else mfg = '26JUL2024:-1:34:27'dt;
run;

proc print data=newCar2;
	title 'New Car Data';
run;

