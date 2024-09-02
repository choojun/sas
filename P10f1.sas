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

*ods listing gpath='/home/u63487999' style=htmlblue;
ods graphics on;
proc capability data=Trans noprint;
   spec lsl = 3.45 usl = 3.55 cleft cright;
   *spec lsl=3.45 usl=3.55;
   /* LSL: lower specification limit and 
   	  USL: upper specification limit (USL) */
   	 
   histogram Thickness;
run;

proc capability data=Trans noprint;
   spec lsl = 3.45 usl = 3.55 cleft cright;
   qqplot Thickness;
   /* The linearity of the point pattern indicates that 
      the measurements are normally distributed */
run;