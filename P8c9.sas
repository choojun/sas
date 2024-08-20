proc report data=grocery;
   title 'Sales for Individual Stores';
   column sector manager department sales Profit;
   define sector / group noprint;
   define manager / group noprint;
   define profit / computed format=dollar11.2;
   define sales / analysis sum format=dollar11.2;
   define department / group format=$deptfmt.;
   
   compute profit;
      if department='np1' or department='np2'
         then profit=0.4*sales.sum;
      else profit=0.25*sales.sum;
   endcomp;
   compute before _page_ / style={just=left};
      line sector $sctrfmt. ' Sector';
      line 'Store managed by ' manager $mgrfmt.;
   endcomp;
   
   break after manager / summarize 
   	   style=[font_style=italic] page;
   
   compute after manager;
      length text $ 35;
      if sales.sum lt 500 then
         text='Sales are below the target region.';
      else if sales.sum ge 500 and sales.sum lt 1000 then
         text='Sales are in the target region.';
      else if sales.sum ge 1000 then
         text='Sales exceeded goal!';
      line text $35.;
   endcomp;
   run;