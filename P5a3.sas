proc print data=raceCar;
	title 'Original Data';
run;

data carTeam;
    set raceCar;
    if points < 30 then delete;
run;

proc print data=carTeam;
	title 'Updated Data';
run;
