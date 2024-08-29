data stocks;
    input Company $9. Date $ Time $ Price;
    datalines;
Top Glove jun11 opening 29
Top Glove jun11 noon    27
Top Glove jun11 closing 27
Top Glove jun12 opening 27
Top Glove jun12 noon    28
Top Glove jun12 closing 30
Vitrox   jun11 opening 43
Vitrox   jun11 noon    43
Vitrox   jun11 closing 44
Vitrox   jun12 opening 44
Vitrox   jun12 noon    45
Vitrox   jun12 closing 45
;

proc transpose data=stocks out=close let;
   by company;
   id date;
run;
 
proc print data=close noobs;
   title 'Closing Prices';
run;