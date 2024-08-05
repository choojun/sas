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

data newCar1;
  	set car;
    *FORMAT mfg date5.; /* 31DEC */
    *FORMAT mfg date6.; /*  31DEC */
    *FORMAT mfg date7.; /* 31DEC24 */ 
    *FORMAT mfg date8.; /*  31DEC24 */ 
    *FORMAT mfg date9.; /* 31DEC2024 */ 
    *FORMAT mfg date11.;/* 31-DEC-2024 */ 
   
	if brand = 'Proton' then mfg = MDY(7, 26, 2015);
    else if brand = 'Produa' then mfg = '26JUL2016'd;
    else if brand = 'Audi' then mfg = '26JUL2017'd;
    else if brand = 'Mercedes' then mfg = '26JUL2018'd;
    else if brand = 'Toyota' then mfg = '26JUL2019'd;
    else if brand = 'Volkswagen' then mfg = '26JUL2020'd;
    else if brand = 'Honda' then mfg = '26JUL2021'd;
    else if brand = 'BMW' then mfg = '26JUL2022'd;
    else if brand = 'Lotus' then mfg = '26JUL2023'd;
    else mfg = '26JUL2024'd;
run;

proc print data=newCar1;
	title 'New Car Data';
run;

