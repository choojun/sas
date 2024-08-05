 proc print data=newRaceCar;
	title 'New RaceCar Data';
run;

data updatedRaceCar;
  set newRaceCar;
  drop lap1;
run;

proc print data=updatedRaceCar;
	title 'New RaceCar Data (Try 1: after dropped a variable)';
run;

data updatedRaceCarAgain;
  set newRaceCar;
  keep team lap1;
run;

proc print data=updatedRaceCarAgain;
	title 'New RaceCar Data (Try 2: after kept two variables)';
run;