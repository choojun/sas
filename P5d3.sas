data missingval;
   length Country $ 10 TourGuide $ 10;
   input Country TourGuide;
   datalines;
Japan Yamada
Italy Militello
Australia Edney
Venezuela .
Brazil Cardoso
;

proc print data=missingval;
   title 'Missing Values for Input Data';
run;

data checkgate;
   length Status $ 15;
   set missingval;
   
   *if TourGuide = ' ' then Status = 'Missing';
   if missing(TourGuide) then Status = 'Missing';
   else Status = 'Available';
run;

proc print data=checkgate;
   var Country TourGuide Status;
   title 'Checking For Missing TourGuide Information';
run;