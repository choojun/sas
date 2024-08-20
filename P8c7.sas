proc report data=grocery;
   column sector manager sales;
   define sector / group format=$sctrfmt.'Sector';
   define manager / group format=$mgrfmt.'Manager';
   define sales / analysis sum format=comma10.2 'Sales';
   
   break after sector / summarize
                        style=[font_style=italic]
                        suppress;
   compute after;
      line 'Combined sales for the northern sectors were '
            sales.sum dollar9.2 '.';
   endcomp;
   compute sales;
      if _break_ ne ' ' then
      call define(_col_,"format","dollar11.2");
   endcomp;
   
   where sector contains 'n';
   title 'Sales Figures for Northern Sectors';
run;