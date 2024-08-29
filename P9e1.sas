proc sql; 

	create table malaysiaStates
		(state char(2),
		date num informat=date9. format=date9.,
		population num);
	describe table malaysiaStates;
run;
quit;