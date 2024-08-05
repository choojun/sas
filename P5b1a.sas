data newRaceCar;
    input team $ lap1 $ lap2 $;
    *format team $upcase9. lap1 comma6.4 lap2 comma6.4;
    datalines;
Proton 12 14
Produa 14 17
Audi 15 20
Barley . .
	 1 1
Mercedes 18 24
Toyota 31 35
Smart . .
	 2 2
Volswagen 32 38 
Honda 35 42
BMW 36 45
Lotus 40 50
	 . .
;
run;

proc print data=newRaceCar;
	title 'New RaceCar Data';
run;

data carTeam;
    set newRaceCar; 
    if lap1 > 35 then lap1Rating = 'excellent';
    else if lap1 > 30 then lap1Rating = 'good';
    else lap1Rating = 'bad';
    
    if lap2 > 35 then lap2Rating = 'excellent';
    else if lap2 > 30 then lap2Rating = 'good';
    else lap2Rating = 'bad';
run;

proc print data=carTeam;
	title 'Updated RaceCar Data';
run;