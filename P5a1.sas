libname myData "/home/u63487999";
data myData.raceCar;
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

proc print data=myData.raceCar;
	title 'Permanent Data';
run;

