data newRaceCar;
    input team $ lap1 $ lap2 $;
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
	length averagePoints 3;
	/* minimum threshold based on lap1 of speed */
	if lap1 > 35 then do;
		*averagePoints = ceil (lap1 + lap2) / 2;
		*averagePoints = floor (lap1 + lap2) / 2;
		*averagePoints = fuzz (lap1 + lap2) / 2;
		*averagePoints = int (lap1 + lap2) / 2;
		*averagePoints = round ( (lap1 + lap2)/9.9,.001);
		averagePoints = trunc ((lap1 + lap2)/2,3);
		
		*rate = min (lap1, lap2) * 0.3;
		*rate = max (lap1, lap2) * 0.3;
		rate = median (lap1, lap2) * 0.3;
		*rate = ranuni (sum(lap1, lap2)) * 0.3;
		*rate = sqrt ( sum(lap1, lap2) * 0.3;
		prize = averagePoints * rate;
		output;
	end;
run;

proc print data=carTeam;
	title 'Updated RaceCar Data';
run;