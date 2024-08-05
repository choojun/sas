data raceCar;
    input team $ points $;
    datalines;
Proton 12
Produa 14
Audi 15
Mercedes 18
Toyota 31
Volswagen 32 
Honda 35
BMW 36
Lotus 40
;
run;

proc print data=raceCar;
	title 'RaceCar Data';
run;