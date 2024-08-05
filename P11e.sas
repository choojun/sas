data city;
   input Year 4. @7 ServicesPolice comma6.
         @15 ServicesFire comma6. @22 ServicesWater_Sewer comma6.
         @30 AdminLabor comma6. @39 AdminSupplies comma6.
         @45 AdminUtilities comma6.;
   ServicesTotal = ServicesPolice+ServicesFire+ServicesWater_Sewer;
   AdminTotal = AdminLabor+AdminSupplies+AdminUtilities;
   Total = ServicesTotal+AdminTotal;
   label               Total='Total Outlays'
               ServicesTotal='Services: Total'
              ServicesPolice='Services: Police'
                ServicesFire='Services: Fire'
         ServicesWater_Sewer='Services: Water & Sewer'
                  AdminTotal='Administration: Total'
                  AdminLabor='Administration: Labor'
               AdminSupplies='Administration: Supplies'
              AdminUtilities='Administration: Utilities' ;
   datalines;
1980  2,819   1,120    422   391      63     98
1981  2,477   1,160    500   172      47     70
1982  2,028   1,061    510   269      29     79
1983  2,754     893    540   227      21     67
1984  2,195     963    541   214      21     59
1985  1,877     926    535   198      16     80
1986  1,727   1,111    535   213      27     70
1987  1,532   1,220    519   195      11     69
1988  1,448   1,156    577   225      12     58
1989  1,500   1,076    606   235      19     62
1990  1,934     969    646   266      11     63
1991  2,195   1,002    643   256      24     55
1992  2,204     964    692   256      28     70
1993  2,175   1,144    735   241      19     83
1994  2,556   1,341    813   238      25     97
1995  2,026   1,380    868   226      24     97
1996  2,526   1,454    946   317      13     89
1997  2,027   1,486  1,043   226       .     82
1998  2,037   1,667  1,152   244      20     88
1999  2,852   1,834  1,318   270      23     74
2000  2,787   1,701  1,317   307      26     66
;

PROC PRINT data = city;
	title "Yearly Data";
RUN;

PROC TRANSPOSE DATA=city OUT=newCity;
RUN;

PROC PRINT data = newCity;
	title "New Yearly Data";
RUN;

