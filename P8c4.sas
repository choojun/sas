proc report data=grocery;
   column manager department sales;
   define manager / order order=formatted format=$mgrfmt.;
   define department / order order=internal format=$deptfmt.;
   
   define sales / analysis sum format=dollar7.2;
   break after manager / summarize style=[font_style=italic];
   
   where sector='se';
   title 'Sales for the Southeast Sector';
run;


