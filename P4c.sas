data time_slot;
   input Date date11. @11 Time $12-15 Room $16-23;
   format date date11.;
   
   *input Date date11. @11 Time $12-16 Room $17-23;
   *format date date11.;
   
   *input Date date10. @11 Time $12-16 Room $17-23;
   *format date date10.;
   datalines;
14jul2023  10:00  B103
14jul2023  10:30  B103
14jul2023  11:00  B207
15jul2023  10:00  A105
15jul2023  10:30  A105
17jul2023  11:00  A207
;
run;

proc print data=time_slot;
   title 'Dates, Times, and Locations of Conferences';
run;