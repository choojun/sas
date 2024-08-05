data departuredays;
   length Country $ 10 CitiesInTour $ 3;
   input Country CitiesInTour;
   datalines;
Japan 5
Italy 8
Australia 12
Venezuela 4
Brazil 4
Malaysia .
;

data updatedDeparture;
   set departuredays;
   length dayOfDeparture $8;
   
   if missing(CitiesInTour) then CitiesInTour = 1;
   
   if CitiesInTour <=7 then dayOfDeparture = 'Sunday';
   else dayOfDeparture = ' ';
run;

proc print data=updatedDeparture;
   var Country CitiesInTour dayOfDeparture;
   title 'Departure Day is Sunday or Missing';
run;