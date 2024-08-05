proc print data=newRaceCar;
	title 'New RaceCar Data';
run;

data carTeam;
	set newRaceCar; 
    
    /* minimum threshold based on lap1 of speed 
       and team is not empty */
    if lap1 > 35 and team ^= '' then do;
    	averagePoints = floor (lap1 + lap2) / 2;
    	rate = min (lap1, lap2) * 0.3;
    	
    	format prize dollar7.2;
    	*format prize comma7.2;  
    	prize = averagePoints * rate;
    	output;
    end;

run;

proc print data=carTeam;
	title 'Updated RaceCar Data';
run;