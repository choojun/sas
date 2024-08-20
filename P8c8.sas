proc report data=grocery split='*';
   column sector manager department, sales total;
   define sector / group format=$sctrfmt. 'Sector' '';
   define manager / group format=$mgrfmt. 'Manager* ';
   define department / across format=$deptfmt. 'Department';
   define sales / analysis sum format=dollar11.2 ' ';
   define total / computed format=dollar11.2 'All*Total Here';
                
   compute total;
      total=sum(_c3_, _c4_);
   endcomp;
   compute after;
      line  'Combined sales for Apparel: '
            _c3_ dollar11.2 '';
      line  'Combined sales for Pharmacy: '
            _c4_ dollar11.2 '';
      line  'Combined sales for all: '
            _c5_ dollar11.2 '';
   endcomp;
         
   where sector contains 'n'
         and (department='p1' or department='p2');
         
   title 'Sales Figures for all in Northern Sectors';
run;

