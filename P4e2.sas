proc print data=class;
   title 'Acting Class Roster';
run;

data class2;
   input Name $ 1-25 Year $ 26-34 Major $ 36-57;
   datalines;
Hitchcock-Tyler, Erin    second
Keil, Deborah            third     Software Engineering
Nacewicz, Chester        third     Data Science
Norgaard, Rolf           second
Prism, Lindsay           fourth    Software Development
Singh, Rajiv             second
Wittich, Stefan          third     Information Technology
;
run;

proc print data=class2;
   title 'Acting Class Roster';
   title2 '(second section)';
run;



