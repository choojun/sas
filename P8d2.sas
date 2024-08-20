proc report data=grocery
   out=profit( where=(sales gt 1000 and _break_='') );
   
   column manager sales manager_pct;
   define manager / group;
   define manager_pct / computed;
   
   compute before;
      total_sales = sales.sum;
   endcomp;

   compute manager_pct;
      manager_pct = sales.sum /total_sales;
   endcomp;
run;