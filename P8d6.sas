proc report data=grocery; 
   	col Sector Manager Department;

   	define Sector / style(column)=[cellwidth=.5in];
	define Manager / style(column)=[cellwidth=.5in];
	define Department / style(column)=[cellwidth=.5in];
	
	title "My Sales Report";
run;