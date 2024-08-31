data grades;
   input Name &$14. Gender :$2. Section :$3. ExamGrade1 @@;
   datalines;
Abdallah       F Mon  46 Anderson       M Wed  75
Aziz           F Wed  67 Bayer          M Wed  77
Bhatt          M Fri  79 Blair          F Fri  70
Bledsoe        F Mon  63 Boone          M Wed  58
Burke          F Mon  63 Chung          M Wed  85
Cohen          F Fri  89 Drew           F Mon  49
Dubos L        M Mon  41 Elliott        F Wed  85
Farmer         F Wed  58 Franklin       F Wed  59
Freeman        F Mon  79 Friedman       M Mon  58
Gabriel        M Fri  75 Garcia         M Mon  79
Harding        M Mon  49 Hazelton       M Mon  55
Hinton         M Fri  85 Hung           F Fri  98
Jacob          F Wed  64 Janeway        F Wed  51
Jones          F Mon  39 Jorgensen      M Mon  63
Judson         F Fri  89 Kuhn           F Mon  89
LeBlanc        F Fri  70 Lee            M Fri  48
Litowski       M Fri  85 Malloy         M Wed  79
Meyer          F Fri  85 Nichols        M Mon  58
Oliver         F Mon  41 Park           F Mon  77
Patel          M Wed  73 Randleman      F Wed  46
Robinson       M Fri  64 Shien          M Wed  55
Simonson       M Wed  62 Smith N        M Wed  71
Smith R        M Mon  79 Sullivan       M Fri  77
Swift          M Wed  63 Wolfson        F Fri  79
Wong           F Fri  89 Zabriski       M Fri  89
;

proc univariate data=grades noprint;
   *histogram ExamGrade1;
   *histogram Examgrade1 / vminor=4 grid lgrid=34;
   *histogram Examgrade1 / vscale=count vaxis=0 to 16 by 2 vminor=1;
   *histogram Examgrade1 / vscale=percent vaxis=0 to 50 by 2 vminor=1;
   *histogram Examgrade1 / vscale=proportion vaxis=0 to 1 by 2 vminor=1;
   
   /*to specify ranges with midpoints from 55 to 95*/
   histogram Examgrade1 / vscale=count vaxis=0 to 16 by 2 vminor=1  
                          midpoints=35 45 55 65 75 85 95 hoffset=10
                          vaxislabel='Frequency';
   inset n='No. Students' mean='Mean Grade' min='Lowest Grade' 
         max='Highest Grade' / header='Summary Statistics' position=ne format=3.;
   title 'Grades for Exam';
run;
