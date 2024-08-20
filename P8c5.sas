proc report data=grocery;
   column manager department sales
          sales=salesmin
          sales=salesmax;
   /* These created aliases enable us to use 
   	  a separate definition of Sales for 
   	  each of the three columns. */
          
   define manager / order order=formatted 
   					format=$mgrfmt. 'Manager';
   define department / order order=internal 
   					format=$deptfmt. 'Department';
   					
   define sales / analysis sum format=dollar7.2 'Sales';
   define salesmin / analysis min noprint;
   define salesmax / analysis max noprint;
   
   compute after;
      line 'Departmental sales ranged from'
            salesmin dollar7.2  " " 'to' " " salesmax dollar7.2;         
   endcomp;
   /* This COMPUTE statement begins a compute block that 
   executes at the end of the report. */
   
   where sector='se';
   title 'Sales for the Southeast Sector';
   title2 "for &sysdate";
run;


