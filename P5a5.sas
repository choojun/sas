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
	title 'Original Data';
run;

data carTeam;
    set raceCar;
    if points > 35 then rating = 'excellent';
    else if points > 30 then rating = 'good';
    else rating = 'bad';
run;

proc print data=carTeam;
	title 'Updated Data';
run;