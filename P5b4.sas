proc print data=newRaceCar;
	title 'New RaceCar Data';
run;

data carTeam;
    set newRaceCar; 

    /* minimum threshold based on lap1 of speed 
       and team is not empty */
    if lap1 > 35 & team ^= '' then status = 'Winner';
    else delete;
run;

proc print data=carTeam;
	title 'Updated RaceCar Data';
run;

proc print data=newRaceCar;
	title 'New RaceCar Data 2';
run;