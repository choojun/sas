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