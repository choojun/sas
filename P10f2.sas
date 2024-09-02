/* For observation: Normal data distribution */
data Trans;
   input Thickness @@;
   label Thickness='Plating Thickness';
   datalines;
3.468 3.428 3.509 3.516 3.461 3.492 3.478 3.556 3.482 3.512
3.490 3.467 3.498 3.519 3.504 3.469 3.497 3.495 3.518 3.523
3.458 3.478 3.443 3.500 3.449 3.525 3.461 3.489 3.514 3.470
3.561 3.506 3.444 3.479 3.524 3.531 3.501 3.495 3.443 3.458
3.481 3.497 3.461 3.513 3.528 3.496 3.533 3.450 3.516 3.476
3.512 3.550 3.441 3.541 3.569 3.531 3.468 3.564 3.522 3.520
3.505 3.523 3.475 3.470 3.457 3.536 3.528 3.477 3.536 3.491
3.510 3.461 3.431 3.502 3.491 3.506 3.439 3.513 3.496 3.539
3.469 3.481 3.515 3.535 3.460 3.575 3.488 3.515 3.484 3.482
3.517 3.483 3.467 3.467 3.502 3.471 3.516 3.474 3.500 3.466
;

proc capability data=Trans noprint;
   spec lsl = 3.45 usl = 3.55 cleft cright;
   qqplot Thickness / normal (mu=est sigma=est)
						square
						nospeclegend
						odstitle=title;
run;



/* For observation: Non-normal data distribution */
data Measures;
   input Diameter @@;
   label Diameter='Diameter in mm';
   datalines;
5.501  5.251  5.404  5.366  5.445  5.576  5.607
5.200  5.977  5.177  5.332  5.399  5.661  5.512
5.252  5.404  5.739  5.525  5.160  5.410  5.823
5.376  5.202  5.470  5.410  5.394  5.146  5.244
5.309  5.480  5.388  5.399  5.360  5.368  5.394
5.248  5.409  5.304  6.239  5.781  5.247  5.907
5.208  5.143  5.304  5.603  5.164  5.209  5.475
5.223
;

title 'Normal Q-Q Plot for Diameters';
proc capability data=Measures noprint;
   spec lsl = 5.25 usl = 6.00 cleft cright;
   qqplot Diameter / normal (mu=est sigma=est)
						square
						nospeclegend
						odstitle=title;
run;



/* For observation: using three-parameter lognormal plot */
title 'Lognormal Q-Q Plot for Diameters';
proc capability data=Measures noprint;
   spec lsl = 5.25 usl = 6.00 cleft cright;
   qqplot Diameter / lognormal(sigma=0.2 0.5 0.8)
                     square
                     odstitle=title;
run;

/* For observation: estimating percentiles */
title 'Lognormal Q-Q Plot for Diameters';
proc capability data=Measures noprint;
   qqplot Diameter / lognormal (sigma=0.5 theta=5 slope=0.39)
                     pctlaxis(grid)
                     vref  = 5.8 5.9 6.0;
run;



/* For observation: using two-parameter lognormal plot */
data Measures;
   set Measures;
   Logdiam=log(Diameter-5);
   label Logdiam='log(Diameter-5)';
run;

title 'Two-Parameter Lognormal Q-Q Plot for Diameters';
proc capability data=Measures noprint;
   qqplot Logdiam / normal (mu=est sigma=est)
                    square
                    odstitle=title;
run;