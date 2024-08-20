proc report data=grocery; 
   col Sector Manager Department;
   define Sector--Department / display;

   compute Sector;
	if Sector = 'se' then
		call define('Sector', "style", "style=[background=cyan]"); 
   endcomp;
   
   compute Manager;
	if Manager > 1 then
		call define('Sector', "style/merge", "style=[color=red]"); 
		*call define('Sector', "style/replace", "style=[color=red]"); 
   endcomp;
   
   title "My Sales Report";
run;